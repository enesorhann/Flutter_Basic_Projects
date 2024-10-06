import 'dart:collection';
import 'package:bp_kisiler/cubit/detay_cubit.dart';
import 'package:bp_kisiler/views/anasayfa.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../entity/kisiler.dart';

class Detaykisi extends StatefulWidget {

  Kisiler kisi;

  Detaykisi(this.kisi);

  @override
  State<Detaykisi> createState() => _DetaykisiState();
}

class _DetaykisiState extends State<Detaykisi> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

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
          context.read<DetayCubit>().kisiGuncelle(widget.kisi.kisi_id, tfKisiAd.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        },
        tooltip: 'Guncelle',
        icon:  Icon(Icons.update),
        label: Text("Guncelle"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
