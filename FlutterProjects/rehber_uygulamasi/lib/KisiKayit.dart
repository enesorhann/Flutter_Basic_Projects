import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehber_uygulamasi/Kisilerdao.dart';
import 'package:rehber_uygulamasi/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Kisikayit extends StatefulWidget {

  @override
  State<Kisikayit> createState() => _KisikayitState();
}

class _KisikayitState extends State<Kisikayit> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();
  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> ekle(String kisi_ad,String kisi_tel) async{
    var bilgi = HashMap<String,dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(bilgi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Rehber"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAd,
                decoration: InputDecoration(
                  hintText: "Ad",
                ),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(
                  hintText: "Telefon Numarasi",
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          ekle(tfKisiAd.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        },
        tooltip: 'Kayit',
        icon:  Icon(Icons.save),
        label: Text("Kaydet"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
