import 'dart:io';

void main(){
  print("Kac gun calistiniz: ");
  int gun = int.parse(stdin.readLineSync()!);
  int sonuc= maasHesapla(gun);
  print("$gun gun calisan birinin maasi -> $sonuc");
  
}
int maas=0;
int maasHesapla(int gunSayisi){
  int len = gunSayisi*8;
  if(len <= 160){
    maas += 10*len;
  }
  else{
    maas += 1600+20*(len-160);
  }
  return maas;
}