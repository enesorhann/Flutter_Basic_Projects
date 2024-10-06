import 'package:bp_kisiler/repo/kisiler_dao_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KayitCubit extends Cubit<void>{
  KayitCubit():super(0);

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> kisiEkle(String kisi_ad,String kisi_tel) async{
    var bilgi = Map<String,dynamic>();
    bilgi["kisi_id"] = "";
    bilgi["kisi_ad"] = kisi_ad;
    bilgi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(bilgi);
  }
}