import 'dart:io';

void main(){
print("Kelime Giriniz: ");
String word = stdin.readLineSync()!;
print("Harf Giriniz: ");
var char = stdin.readLineSync()!;
kactaneVar(word, char);
}

void kactaneVar(String kelime,var harf){
  int count=0;
  for(int i = 0;i<kelime.length;i++){
    if(kelime[i]==harf){
      count+=1;
    }
  }
  print("$harf harfinden $count tane var.");
}