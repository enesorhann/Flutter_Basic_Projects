import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse/Filmler.dart';
import 'package:json_parse/FilmlerCevap.dart';

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

  void filmlerCevapParse(){
    String strVeri = '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png",'
        '"kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var jsonVeri = jsonDecode(strVeri);
    var filmlerCevap = Filmlercevap.fromJson(jsonVeri);
    int success = filmlerCevap.success;
    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;

    print("Success $success");

    for(var f in filmlerListesi){
      print("********************************");
      print("Film id: ${f.film_id}");
      print("Film ad: ${f.film_ad}");
      print("Film yil: ${f.film_yil}");
      print("Film resim: ${f.film_resim}");
      print("Kategori ad: ${f.kategori.kategori_ad}");
      print("Yonetmen ad: ${f.yonetmen.yonetmen_ad}");
    }
  }

  @override
  void initState() {
    super.initState();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

      ),
    );
  }
}
