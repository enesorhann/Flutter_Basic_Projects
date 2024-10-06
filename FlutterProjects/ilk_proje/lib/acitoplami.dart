import 'dart:io';

void main(){
  print("Kenar Sayisini Giriniz: ");
  int edge = int.parse(stdin.readLineSync()!);
  int res= toplam(edge);
  print("$edge kenarli bir seklin ic acilar toplami $res");
}
int toplam(int kenarSayisi){
  int sonuc= (kenarSayisi-2)*180;
  return sonuc;
}