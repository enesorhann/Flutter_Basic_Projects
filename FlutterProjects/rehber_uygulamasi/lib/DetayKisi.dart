import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehber_uygulamasi/Kisiler.dart';
import 'package:rehber_uygulamasi/Kisilerdao.dart';
import 'package:rehber_uygulamasi/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Detaykisi extends StatefulWidget {

  Kisiler kisi;

  Detaykisi(this.kisi);

  @override
  State<Detaykisi> createState() => _DetaykisiState();
}

class _DetaykisiState extends State<Detaykisi> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> guncelle(String kisi_id,String kisi_ad,String kisi_tel) async{
    var bilgi = HashMap<String,dynamic>();
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.child(kisi_id).update(bilgi);
  }
  @override
  void initState() {
    super.initState();
    tfKisiAd.text = widget.kisi.kisi_ad;
    tfKisiTel.text = widget.kisi.kisi_tel;
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
                  hintText: "Kisi Ad",
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
          guncelle(widget.kisi.kisi_id, tfKisiAd.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        },
        tooltip: 'Guncelle',
        icon:  Icon(Icons.update),
        label: Text("Guncelle"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
