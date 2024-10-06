import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';
import 'package:notlar_uygulamasi/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Notlar.dart';

class Notdetay extends StatefulWidget {

  Notlar not;
  Notdetay({required this.not});

  @override
  State<Notdetay> createState() => _NotdetayState();
}

class _NotdetayState extends State<Notdetay> {

  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();

  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> sil(String not_id) async{
    refNotlar.child(not_id).remove();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }
  Future<void> guncelle(String not_id,String dersAdi,int not1,int not2) async{
    var bilgi = HashMap<String,dynamic>();
    bilgi["ders_adi"] = dersAdi;
    bilgi["not1"] = not1;
    bilgi["not2"] = not2;
    refNotlar.child(not_id).update(bilgi);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }


  @override
  void initState() {
    super.initState();
    var not = widget.not;
    tfDersAdi.text = not.ders_adi;
    tfNot1.text = not.not1.toString();
    tfNot2.text = not.not2.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          TextButton(
            child: Text("Sil",style: TextStyle(color: Colors.white),),
            onPressed: (){
              sil(widget.not.not_id);
            },
          ),
          TextButton(
              child: Text("Guncelle",style: TextStyle(color: Colors.white),),
            onPressed: (){
              guncelle(widget.not.not_id, tfDersAdi.text, int.parse(tfNot1.text), int.parse(tfNot2.text));
            },
          ),
        ],

        backgroundColor: Colors.blue,

        title: Text("Not Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(
                  hintText: "Ders Adini Giriniz"
                ),
              ),
              TextField(
                controller: tfNot1,
                decoration: InputDecoration(
                    hintText: "1. Notu Giriniz"
                ),
              ),
              TextField(
                controller: tfNot2,
                decoration: InputDecoration(
                    hintText: "2. Notu Giriniz"
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
