import 'package:veritabani_rehber/Kisiler.dart';
import 'package:veritabani_rehber/VeriTabaniYardimcisi.dart';

class Kisilerdao{
  Future<List<Kisiler>> tumKisiler() async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }
  Future<void> kisiEkle(String kisi_ad,int kisi_yas) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db.insert("kisiler", bilgiler);
  }
  Future<void> kisiSil(int kisi_id) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    await db.delete("kisiler",where: "kisi_id = ?",whereArgs: [kisi_id]);
  }
  Future<void> kisiGuncelle(int kisi_id,String kisi_ad,int kisi_yas) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db.update("kisiler", bilgiler,where: "kisi_id = ?",whereArgs: [kisi_id]);
  }
  Future<int> kayitKontrol(String kisi_ad) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) as sonuc FROM kisiler WHERE kisi_ad = '$kisi_ad'");

    return maps[0]["sonuc"];
  }
  Future<Kisiler> kayitGetir(int kisi_id) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id=$kisi_id");

      var satir = maps[0];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
  }
  Future<List<Kisiler>> kisiArama(String arananVeri) async{

    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }
}