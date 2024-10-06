import 'dart:io';

void main(){
print("Faktoriyelini almak istediginiz sayiyi giriniz: ");
int factor= int.parse(stdin.readLineSync()!);
int sonuc= fakt(factor);
print("$factor sayisinin faktoriyeli -> $sonuc");
}

int fakt(int sayi){
  int carpim= 1;
  while(sayi>0){
    carpim *= sayi;
    sayi--;
  }
  return carpim;
}