import 'dart:io';

void main(){
print("Enter first edge len: ");
int ed1 = int.parse(stdin.readLineSync()!);
print("Enter sec edge len: ");
int ed2 = int.parse(stdin.readLineSync()!);
cevreHesapla(ed1, ed2);
}
void cevreHesapla(int edge1,int edge2){
  int sonuc= edge1*edge2;
  print("Dortgenin Cevresi: $sonuc");
}