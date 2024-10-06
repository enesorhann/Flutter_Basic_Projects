import 'dart:collection';
import 'package:bp_kisiler/cubit/kayit_cubit.dart';
import 'package:bp_kisiler/views/anasayfa.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Kisikayit extends StatefulWidget {

  @override
  State<Kisikayit> createState() => _KisikayitState();
}

class _KisikayitState extends State<Kisikayit> {

  var tfKisiAd = TextEditingController();
  var tfKisiTel = TextEditingController();

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
          context.read<KayitCubit>().kisiEkle(tfKisiAd.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        },
        tooltip: 'Kayit',
        icon:  Icon(Icons.save),
        label: Text("Kaydet"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
