import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_listener_apply/MathRepo.dart';

class CubitPage extends Cubit<int>{
  CubitPage():super(0);

  var mRepo = Mathrepo();

  void toplamaYap(String alinanSayi1,String alinanSayi2){
    emit(mRepo.topla(alinanSayi1, alinanSayi2));
  }
  void carpmaYap(String alinanSayi1,String alinanSayi2){
    emit(mRepo.carp(alinanSayi1, alinanSayi2));
  }
}