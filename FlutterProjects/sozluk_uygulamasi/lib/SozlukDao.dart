import 'package:sozluk_uygulamasi/Kelimeler.dart';
import 'package:sozluk_uygulamasi/Veritabaniyardimcisi.dart';

class Sozlukdao{

  Future<List<Kelimeler>> sozlukGetir() async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }
  Future<List<Kelimeler>> aramaYap(String aranacak) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce LIKE '%$aranacak%' ");

    return List.generate(maps.length, (i){
      var satir = maps[i];
      return Kelimeler(satir["kelime_id"], satir["ingilizce"], satir["turkce"]);
    });
  }
}