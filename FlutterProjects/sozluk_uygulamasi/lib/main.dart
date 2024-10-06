import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sozluk_uygulamasi/DetaySayfa.dart';
import 'package:sozluk_uygulamasi/Kelimeler.dart';
import 'package:sozluk_uygulamasi/KelimelerCevap.dart';
import 'package:sozluk_uygulamasi/SozlukDao.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool aramaYapiliyorMu = false;
  var arananKelime = " ";
  var refKelimeler = FirebaseDatabase.instance.ref().child("kelimeler");

  Future<List<Kelimeler>> sozlukGoster() async{
    var kelimeListesi = Sozlukdao().sozlukGetir();
    return kelimeListesi;
  }
  Future<List<Kelimeler>> arama(String aranan) async{
    var kelimeListesi = Sozlukdao().aramaYap(aranan);
    return kelimeListesi;
  }

  /*
  List<Kelimeler> parseKelimeler(String cevap){
    return Kelimelercevap.fromJson(json.decode(cevap)).kelimelerListesi;
  }
*/

  /*
  Future<List<Kelimeler>> tumKelimeler() async{

    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php");
    var cevap = await http.get(url);
    return parseKelimeler(cevap.body);
  }
  */

  /*
  Future<List<Kelimeler>> aramaYap(String arananKelime) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/sozluk/kelime_ara.php");
    var aramaAktarmasi = {"ingilizce":arananKelime};
    var cevap = await http.post(url,body: aramaAktarmasi);
    return parseKelimeler(cevap.body);
  }
  */

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,

        actions: [
          aramaYapiliyorMu ? IconButton(
      icon: Icon(Icons.cancel),
      onPressed: (){
        setState(() {
          aramaYapiliyorMu = false;
          arananKelime= "";
        });
      },
    )   :  IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],

        title: aramaYapiliyorMu ? TextField(
          onChanged: (yazilanKelime){
            setState(() {
              arananKelime = yazilanKelime;
            });
          },
          decoration: InputDecoration(
            hintText: "Arama icin birseyler yazin",
          ),
        ) : Text("Sozluk Uygulamasi"),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refKelimeler.onValue,
        builder: (context,event){
          if(event.hasData){
            var kelimelerListesi = <Kelimeler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic; // as dynamic eklenmediği zaman forEach taninmiyor
            if(gelenDegerler != null){
              gelenDegerler.forEach((key,nesne){
                var gelenKelime = Kelimeler.fromJson(key, nesne);
                if(aramaYapiliyorMu){
                  if(gelenKelime.ingilizce.contains(arananKelime)){
                    kelimelerListesi.add(gelenKelime);
                  }
                }else{
                  kelimelerListesi.add(gelenKelime);
                }

              });
            }

            return ListView.builder(
              itemCount: kelimelerListesi.length,
              itemBuilder: (context,index){
                var satirBilgisi = kelimelerListesi[index]; // Satirdaki iki kelimeyi de alir.
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(kelime: satirBilgisi)));
                  },
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(satirBilgisi.ingilizce,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Text(satirBilgisi.turkce,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.deepOrangeAccent),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
