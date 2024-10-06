/*
import 'Kelimeler.dart';


class Kelimelercevap{
  int success;
  List<Kelimeler> kelimelerListesi;

  Kelimelercevap(this.success, this.kelimelerListesi);

  factory Kelimelercevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kelimeler"] as List;
    List<Kelimeler> kelimeler = jsonArray.map((jsonArrayNesnesi) => Kelimeler.fromJson(jsonArrayNesnesi)).toList();
    return Kelimelercevap(json["success"] as int,kelimeler);
  }
}
*/