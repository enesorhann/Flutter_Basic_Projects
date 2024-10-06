import 'package:notlar_uygulamasi/NotCevap.dart';
import 'package:notlar_uygulamasi/NotDetay.dart';
import 'package:notlar_uygulamasi/NotKayit.dart';
import 'package:notlar_uygulamasi/Notlar.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';
import 'package:notlar_uygulamasi/firebase_options.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");
/*


  List<Notlar> parseNotlarCevap(String sayfaVerisi){
    return Notcevap.fromJson(json.decode(sayfaVerisi)).notlarListesi;
  }
  */

  /*
  Future<List<Notlar>> getData() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/notlar/tum_notlar.php");
    var cevap = await http.get(url);
    return parseNotlarCevap(cevap.body);
  }
  */
  Future<bool> exitbyApp() async{
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            exitbyApp();
          },
        ),
        backgroundColor: Colors.blue,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Notlar Uygulamasi",style: TextStyle(color: Colors.white,fontSize: 20),),

            StreamBuilder<DatabaseEvent>(
              stream: refNotlar.onValue,
              builder: (context,event){
                if(event.hasData){
                  var notlar = <Notlar>[];

                  var gelenDegerler = event.data!.snapshot.value as dynamic;

                  if(gelenDegerler != null){
                    gelenDegerler.forEach((key,nesne){
                      var gelenKelime = Notlar.fromJson(key,nesne);
                      notlar.add(gelenKelime);
                    });
                  }

                  double ortalama = 0.0;
                  double toplam = 0.0;
                  if(!notlar!.isEmpty){
                    for(var n in notlar){
                      toplam += (n.not1+n.not2)/2;
                    }
                    ortalama = toplam/notlar.length;
                    return Text("Not Ortalamasi: ${ortalama}",style: TextStyle(color: Colors.white,fontSize: 16),);
                  }else{
                    return Text("Not Ortalamasi: 0",style: TextStyle(color: Colors.white,fontSize: 16),);
                  }
                }else
                  return Text("Not Ortalamasi: 0",style: TextStyle(color: Colors.white,fontSize: 16),);
              }
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: exitbyApp,

        child: StreamBuilder<DatabaseEvent>(
          stream: refNotlar.onValue,
          builder: (context,event){
            if(event.hasData){
              var notlar = <Notlar>[];

              var gelenDegerler = event.data!.snapshot.value as dynamic;

              if(gelenDegerler != null){
                gelenDegerler.forEach((key,nesne){
                  var gelenKelime = Notlar.fromJson(key,nesne);
                  notlar.add(gelenKelime);
                });
              }
        
              return ListView.builder(
                itemCount: notlar!.length,
                itemBuilder: (context,index){
                  var not = notlar[index];
        
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Notdetay(not: not)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(not.ders_adi,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(not.not1.toString(),),
                            Text(not.not2.toString(),),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => Notkayit()));
        },
        tooltip: 'Not Ekle',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
