/*


import 'package:filmler_uygulamasi/Filmler.dart';
import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/Veritabaniyardimcisi.dart';
import 'package:filmler_uygulamasi/Yonetmenler.dart';

class Filmlerdao{

  Future<List<Filmler>> getFilmsbyCategoryId(int category_id) async{
    var db = await Veritabaniyardimcisi.veriTabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler "
        " WHERE kategoriler.kategori_id = filmler.kategori_id and yonetmenler.yonetmen_id = filmler.yonetmen_id "
        " and filmler.kategori_id = $category_id");

    return List.generate(maps.length, (i){
      var satir = maps[i];

      var k= Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var f = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"],satir["film_resim"],k,y);

      return f;
    });
  }
}
 */