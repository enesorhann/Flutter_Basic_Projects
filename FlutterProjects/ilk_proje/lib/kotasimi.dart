import 'dart:io';

void main(){
print("Kac GB kullandiniz: ");
int kullan = int.parse(stdin.readLineSync()!);
int toplam= kotahesapla(kullan);
print("$kullan GB internet tuketim bedeli $toplam TL");
}
int kotahesapla(int kullanim){
  int sonuc=0;
  if(kullanim <= 50){
    sonuc=100;
  }
  else{
    sonuc = 100+ (kullanim-50)*4;
  }
  return sonuc;
}

