/*


import 'package:rehber_uygulamasi/Kisiler.dart';

class Kisicevap{
  int success;
  List<Kisiler> kisilerListesi;

  Kisicevap(this.success, this.kisilerListesi);

  factory Kisicevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisiListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();
    return Kisicevap(json["success"] as int, kisiListesi);
  }
}
*/