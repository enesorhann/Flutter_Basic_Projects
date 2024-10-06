import 'package:flutter/material.dart';

class CostumerInitial extends ChangeNotifier{
  int sayac = 0;

  int sayacOku(){
    return sayac;
  }
  void sayacArttir(){
    sayac += 1;
    notifyListeners();
  }
  void sayacAzalt(){
    sayac -= 2;
    notifyListeners();
  }

}
