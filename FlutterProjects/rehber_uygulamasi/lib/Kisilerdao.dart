import 'package:rehber_uygulamasi/Kisiler.dart';
import 'package:rehber_uygulamasi/Veritabaniyardimcisi.dart';

class Kisilerdao{

  Future<List<Kisiler>> tumKisiler() async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_tel"]);
    });
  }
  Future<List<Kisiler>> aramaYap(String aranan) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad LIKE '%$aranan%'");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_tel"]);
    });
  }
  Future<void> kisiEkle(String kisi_ad,String kisi_tel) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.insert("kisiler", bilgiler);
  }
  Future<void> kisiGuncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;
    await db.update("kisiler", bilgiler,where: "kisi_id=?",whereArgs: [kisi_id]);
  }
  Future<void> kisiSil(int kisi_id) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();
    await db.delete("kisiler",where: "kisi_id=?",whereArgs: [kisi_id]);
  }
}