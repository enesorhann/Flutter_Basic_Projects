import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Detaysayfa extends StatefulWidget {
  Filmler film;

  Detaysayfa(this.film);

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,
        title: Text("${widget.film.film_ad}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("http://kasimadalan.pe.hu/filmler/resimler/${widget.film.film_resim}"),
            Text("${widget.film.film_yil}",style: TextStyle(fontSize: 25),),
            Text("${widget.film.yonetmen_ad}",style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
