
class Kelimeler{
  late String kelime_id;
  late String ingilizce;
  late String turkce;

  Kelimeler(this.kelime_id, this.ingilizce, this.turkce);

  factory Kelimeler.fromJson(String key,Map<dynamic,dynamic> json){
    return Kelimeler(key, json["ingilizce"] as String, json["turkce"] as String);
  }
}