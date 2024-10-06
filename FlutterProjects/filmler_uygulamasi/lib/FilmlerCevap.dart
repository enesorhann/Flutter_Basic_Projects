/*


import 'package:filmler_uygulamasi/Filmler.dart';

class Filmlercevap{
  int success;
  List<Filmler> filmlerListesi;


  Filmlercevap(this.success, this.filmlerListesi);

  factory Filmlercevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["filmler"] as List;
    List<Filmler> filmListesi = jsonArray.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList();
    return Filmlercevap(json["success"] as int,filmListesi);
  }
} */