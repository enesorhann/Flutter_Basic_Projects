

import 'package:flutter/material.dart';
import 'package:login_uygulamasi/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String? kullaniciAdi;
  String? sifre;
  Future<void> oturumBilgisi() async{

    var sp = await SharedPreferences.getInstance();

    setState(() {
      kullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanıcı adı yok";
      sifre = sp.getString("sifre") ?? "Şifre yok";
    });

  }
  Future<void> cikisYap() async{

    var sp = await SharedPreferences.getInstance();

    sp.remove("kullaniciAdi");
    sp.remove("sifre");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginEkrani()));

  }
  @override
  void initState() {
    super.initState();
    oturumBilgisi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              cikisYap();
            },
          ),
        ],
        backgroundColor: Colors.green,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kullanıcı Adı: $kullaniciAdi",style: TextStyle(fontSize: 40),),
            Text("Şifre: $sifre",style: TextStyle(fontSize: 40),),
          ],
        ),
      ),
    );
  }
}
