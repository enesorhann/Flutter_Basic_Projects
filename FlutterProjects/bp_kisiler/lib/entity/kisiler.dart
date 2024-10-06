class Kisiler{
  late String kisi_id;
  late String kisi_ad;
  late String kisi_tel;

  Kisiler(this.kisi_id, this.kisi_ad, this.kisi_tel);

  factory Kisiler.fromJson(String key,Map<dynamic,dynamic> json){
    return Kisiler(key, json["kisi_ad"] as String, json["kisi_tel"] as String);
  }


}