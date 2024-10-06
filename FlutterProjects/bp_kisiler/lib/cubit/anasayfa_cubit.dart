import 'package:bp_kisiler/entity/kisiler.dart';
import 'package:bp_kisiler/repo/kisiler_dao_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit():super(<Kisiler>[]);

  var refKisiler = FirebaseDatabase.instance.ref().child("kisiler");

  Future<void> kisileriYukle() async{
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler != null){
        var liste = <Kisiler>[];
        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          liste.add(kisi);
        });
        emit(liste);
      }
    });
  }
  Future<void> kisiSil(String kisi_id) async{
    refKisiler.child(kisi_id).remove();
  }
  Future<void> kisiArama(String aramaKelimesi) async{
    refKisiler.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      if(gelenDegerler != null){
        var liste = <Kisiler>[];
        gelenDegerler.forEach((key,nesne){
          var kisi = Kisiler.fromJson(key, nesne);
          if(kisi.kisi_ad.contains(aramaKelimesi)){
            liste.add(kisi);
          }
        });
        emit(liste);
      }
    });
  }
}