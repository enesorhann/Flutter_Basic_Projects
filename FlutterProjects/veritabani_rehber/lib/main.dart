import 'package:flutter/material.dart';
import 'package:veritabani_rehber/Kisiler.dart';
import 'package:veritabani_rehber/Kisilerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<void> kisileriGetir() async{
    var kisiler = await Kisilerdao().tumKisiler();

    for(Kisiler k in kisiler){
      print("Kisi ID: ${k.kisi_id}");
      print("Kisi AD: ${k.kisi_ad}");
      print("Kisi YAS: ${k.kisi_yas}");
    }
  }
  Future<void> ekle() async{
    Kisilerdao().kisiEkle("Ceren", 18);
  }
  Future<void> sil() async{
    Kisilerdao().kisiSil(1);
  }
  Future<void> guncelle() async{
    Kisilerdao().kisiGuncelle(2, "Gulenay", 21);
  }
  Future<void> kayitKontrolu() async{
    int k = await Kisilerdao().kayitKontrol("Ceren");
    print("Tablodaki Ceren Sayisi: $k");
  }
  Future<void> satirGetir() async{
    var kisi = await Kisilerdao().kayitGetir(7);
    print("*******************");
    print("Kisi ID: ${kisi.kisi_id}");
    print("Kisi AD: ${kisi.kisi_ad}");
    print("Kisi YAS: ${kisi.kisi_yas}");
    print("*******************");
  }
  Future<void> arama() async{
    var kisiler = await Kisilerdao().kisiArama("ay");

    for(Kisiler k in kisiler){
      print("Kisi ID: ${k.kisi_id}");
      print("Kisi AD: ${k.kisi_ad}");
      print("Kisi YAS: ${k.kisi_yas}");
    }
  }
  @override
  void initState() {
    super.initState();
    //sil();
    //ekle();
    //guncelle();
    //satirGetir();
    //kayitKontrolu();
    //kisileriGetir();
    arama();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
