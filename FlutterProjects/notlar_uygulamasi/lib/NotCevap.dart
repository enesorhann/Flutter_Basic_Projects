/*


import 'Notlar.dart';


class Notcevap{
  int success;
  List<Notlar> notlarListesi;

  Notcevap(this.success, this.notlarListesi);

  factory Notcevap.fromJson(Map<String,dynamic> json){
    var jsonArray = json["notlar"] as List;
    List<Notlar> notlarListesi = jsonArray.map( (jsonArrayNesnesi) => Notlar.fromJson(jsonArrayNesnesi)).toList();
    return Notcevap(json["success"] as int, notlarListesi);
  }
}
                          */