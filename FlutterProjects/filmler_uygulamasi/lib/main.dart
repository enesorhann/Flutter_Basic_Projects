import 'package:filmler_uygulamasi/FilmlerSayfasi.dart';
import 'package:filmler_uygulamasi/KategoriCevap.dart';
import 'package:filmler_uygulamasi/Kategorilerdao.dart';
import 'package:filmler_uygulamasi/firebase_options.dart';
import 'package:flutter/material.dart';
import 'Kategoriler.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var refFilmler = FirebaseDatabase.instance.ref().child("kategoriler");
  //Firebase ile yapilan islemlerde asagidaki fonksiyonlara gerek yok.

/*

  List<Kategoriler> parseKategorilerCevap(String sayfaBody){
    return Kategoricevap.fromJson(json.decode(sayfaBody)).kategorilerListesi;
  }
  */


  /*

  Future<List<Kategoriler>> kategorileriGetir() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/filmler/tum_kategoriler.php");
    var cevap = await http.get(url);
    return parseKategorilerCevap(cevap.body);
  }
  */

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,
        title: Text("Filmler Uygulamasi"),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refFilmler.onValue,
        builder: (context,event){
          if(event.hasData){
            var kategoriListesi = <Kategoriler>[];

            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if(gelenDegerler != null){
              gelenDegerler.forEach((key,object){
                var gelenNesne = Kategoriler.fromJson(key,object);
                kategoriListesi.add(gelenNesne);
              });
            }

            return ListView.builder(
              itemCount: kategoriListesi!.length,
              itemBuilder: (context,index){
                var kategori = kategoriListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Filmlersayfasi(kategori)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kategori.kategori_ad,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kategori.kategori_id.toString(),style: TextStyle(fontWeight: FontWeight.bold),)
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
