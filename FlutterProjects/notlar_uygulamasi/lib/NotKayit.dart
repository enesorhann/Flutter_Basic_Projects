import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:notlar_uygulamasi/Notlardao.dart';
import 'package:notlar_uygulamasi/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Notkayit extends StatefulWidget {
  const Notkayit({super.key});

  @override
  State<Notkayit> createState() => _NotkayitState();
}

class _NotkayitState extends State<Notkayit> {

  var tfDersAdi = TextEditingController();
  var tfNot1 = TextEditingController();
  var tfNot2 = TextEditingController();

  var refNotlar = FirebaseDatabase.instance.ref().child("notlar");

  Future<void> kaydet(String dersAdi,int not1,int not2) async{
    var bilgi = HashMap<String,dynamic>();
    bilgi["not_id"] = "";
    bilgi["ders_adi"] = dersAdi;
    bilgi["not1"] = not1;
    bilgi["not2"] = not2;
    refNotlar.push().set(bilgi);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,

        title: Text("Not Kayit"),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          kaydet(tfDersAdi.text,int.parse(tfNot1.text),int.parse(tfNot2.text));
        },
        tooltip: 'Not Kaydet',
        icon:  Icon(Icons.save),
        label: Text("Kaydet"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
