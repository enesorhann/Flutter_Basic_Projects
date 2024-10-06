import 'dart:io';

void main(){

print("Bugun hava kac derece: ");
double derece = double.parse(stdin.readLineSync()!);
double fahrenheit = donustur(derece);
print("$derece derecenin Fahr karsiligi: $fahrenheit");

}

double donustur(double der){
  double fhr = der*(1.8) + 32;
  return fhr;
}