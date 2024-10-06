class Notlar{
  late String not_id;
  late String ders_adi;
  late int not1;
  late int not2;

  Notlar(this.not_id, this.ders_adi, this.not1, this.not2);

  factory Notlar.fromJson(String key,Map<dynamic,dynamic> json){
    return Notlar(key,
        json["ders_adi"] as String,
        json["not1"] as int,
        json["not2"] as int);
  }
}