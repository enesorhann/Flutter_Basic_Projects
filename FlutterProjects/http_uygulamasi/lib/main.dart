import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_uygulamasi/Kisiler.dart';
import 'package:http_uygulamasi/KisilerCevap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  List<Kisiler> parseKisilerCevap(String cevap){
    return KisilerCevap.fromJson(jsonDecode(cevap)).kisilerListesi;
  }


  Future<List<Kisiler>> tumKisiler() async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<List<Kisiler>> kisiArama(String aramaKelimesi) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    var veri = {"kisi_ad":aramaKelimesi};
    var cevap = await http.post(url,body: veri);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiSil(int kisi_id) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString()};
    var cevap = await http.post(url,body: veri);
    print("Answer: ${cevap.body}");
  }

  Future<void> kisiEkle(String kisi_ad,String kisi_tel) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php");
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await http.post(url,body: veri);
    print("Answer: ${cevap.body}");
  }

  Future<void> kisiGuncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await http.post(url,body: veri);
    print("Answer: ${cevap.body}");
  }

  Future<void> showKisiler() async{
    var kisiler = await kisiArama("j");

    for(var k in kisiler){
      print("**********************");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi ad: ${k.kisi_ad}");
      print("Kisi tel: ${k.kisi_tel}");
    }
  }

  @override
  void initState() {
    super.initState();
    //showKisiler();
    kisiSil(17537);
    //kisiEkle("test_ad", "test_tel");
    //kisiGuncelle(17536, "Kasim_Hocam", "11111111111");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Anasayfa"),
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
