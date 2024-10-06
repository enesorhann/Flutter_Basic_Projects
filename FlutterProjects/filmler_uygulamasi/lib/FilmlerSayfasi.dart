import 'package:filmler_uygulamasi/DetaySayfa.dart';
import 'package:filmler_uygulamasi/FilmlerCevap.dart';
import 'package:filmler_uygulamasi/Filmlerdao.dart';
import 'package:filmler_uygulamasi/Kategorilerdao.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Filmler.dart';
import 'Kategoriler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Filmlersayfasi extends StatefulWidget {

  Kategoriler kategori;

  Filmlersayfasi(this.kategori);

  @override
  State<Filmlersayfasi> createState() => _FilmlersayfasiState();
}

class _FilmlersayfasiState extends State<Filmlersayfasi> {

  var refFilmler = FirebaseDatabase.instance.ref().child("filmler");
  //Firebase ile yapilan islemlerde asagidaki fonksiyonlara gerek yok.

/*
  List<Filmler> parseFilmlerCevap(String sayfaBody){
    return Filmlercevap.fromJson(json.decode(sayfaBody)).filmlerListesi;
  }

  Future<List<Filmler>> filmleriGetir(int kategori_id) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/filmler/filmler_by_kategori_id.php");
    var veri = {"kategori_id":kategori_id.toString()};
    var cevap = await http.post(url,body: veri);
    return parseFilmlerCevap(cevap.body);
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,
        title: Text("${widget.kategori.kategori_ad} Filmleri"),
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: refFilmler.orderByChild("kategori_ad").equalTo(widget.kategori.kategori_ad).onValue,
        builder: (context,event){
          if(event.hasData){
            var filmlerListesi = <Filmler>[];
            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if(gelenDegerler != null){
              gelenDegerler.forEach((key,object){
                var gelenNesne = Filmler.fromJson(key, object);
                filmlerListesi.add(gelenNesne);
              });
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context,index){
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(film)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network("http://kasimadalan.pe.hu/filmler/resimler/${film.film_resim}"),
                          Text(film.film_ad,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
