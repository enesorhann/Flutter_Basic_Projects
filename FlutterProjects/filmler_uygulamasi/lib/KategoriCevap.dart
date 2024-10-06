/*


import 'Kategoriler.dart';

class Kategoricevap{
  int success;
  List<Kategoriler> kategorilerListesi;

  Kategoricevap(this.success, this.kategorilerListesi);

  factory Kategoricevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["kategoriler"] as List;
    List<Kategoriler> kategoriListesi = jsonArray.map((jsonArrayNesnesi) => Kategoriler.fromJson(jsonArrayNesnesi)).toList();
    return Kategoricevap(json["success"] as int,kategoriListesi);
  }
}
*/