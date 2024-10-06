import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rehber_uygulamasi/DetayKisi.dart';
import 'package:rehber_uygulamasi/KisiCevap.dart';
import 'package:rehber_uygulamasi/KisiKayit.dart';
import 'package:rehber_uygulamasi/Kisiler.dart';
import 'package:rehber_uygulamasi/Kisilerdao.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehber_uygulamasi/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  String aranacakText = "";
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

/*
  List<Kisiler> parseKisilerCevap(String sayfaBody){
    return Kisicevap.fromJson(json.decode(sayfaBody)).kisilerListesi;
  }
  */

  /*
  Future<List<Kisiler>> rehberiGetir() async{
    var url = Uri.parse("kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }
  */

  Future<void> sil(String kisi_id) async{
    refKisiler.child(kisi_id).remove();
    setState(() {
    });
  }

/*


  Future<List<Kisiler>> arama(String aranan) async{
    refKisiler.orderByChild("kisi_ad").equalTo(aranan).onValue;
  }
  */

  Future<bool> exitApp() async{
    exit(0);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            exitApp();
          },
        ),
        actions: [
          aramaYapiliyorMu ? IconButton(
              icon: Icon(Icons.cancel),
              onPressed: (){
                setState(() {
                  aramaYapiliyorMu = false;
                  aranacakText = "";
                });
              },
            ) :
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: aramaYapiliyorMu ? TextField(
          decoration: InputDecoration(hintText: "Arama icin birsey yazin"),
          onChanged: (aranacak){
            setState(() {
              aranacakText = aranacak;
            });
          },
        ) :  Text("Rehber"),
      ),
      body: WillPopScope(
        onWillPop: exitApp,
        child: StreamBuilder<DatabaseEvent>(
          stream: refKisiler.onValue,
          builder: (context,event){
            if (event.hasData){
              var kisiler = <Kisiler>[];

              var gelenDegerler = event.data!.snapshot.value as dynamic;

              if(gelenDegerler != null){
                gelenDegerler.forEach((key,object){
                  var gelenKisi = Kisiler.fromJson(key, object);
                  if(aramaYapiliyorMu){
                    if(gelenKisi.kisi_ad.contains(aranacakText)){
                      kisiler.add(gelenKisi);
                    }
                  }else{
                    kisiler.add(gelenKisi);
                  }

                });
              }

              return ListView.builder(
                itemCount: kisiler!.length,
                itemBuilder: (context,index){
                  var kisi = kisiler[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detaykisi(kisi)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(kisi.kisi_ad,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(kisi.kisi_tel),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                                sil(kisi.kisi_id);
                              },
                            ),
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
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Kisikayit()));
        },
        tooltip: 'Kayit',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
