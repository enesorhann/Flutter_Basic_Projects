import 'package:flutter/material.dart';
import 'package:login_uygulamasi/Anasayfa.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool> kontrol() async{

    var sp = await SharedPreferences.getInstance();

    String kullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanıcı adı yok";
    String sifre = sp.getString("sifre") ?? "Şifre yok";

    if(kullaniciAdi == "admin" && sifre == "123"){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: kontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool? gecisIzni = snapshot.data;
            if (gecisIzni == true) {
              return Anasayfa();
            } else {
              return LoginEkrani();
            }
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

class LoginEkrani extends StatefulWidget {

  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> girisKontrol() async{

    String ka = tfKullaniciAdi.text;
    String s = tfSifre.text;

    if(ka == "admin" && s == "123"){
      var sp = await SharedPreferences.getInstance();

      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", s);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Anasayfa()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Login Ekrani"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı"
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  controller: tfSifre,
                  decoration: InputDecoration(
                      hintText: "Şifre"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    child: Text("Giriş Yap",style: TextStyle(fontSize: 30),),
                  onPressed: (){
                    girisKontrol();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
