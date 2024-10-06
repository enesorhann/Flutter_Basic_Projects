
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});


  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var ulkeListe = <String>[];
  var secilenUlke = "Turkiye";

  @override
  void initState() {
    super.initState();
    ulkeListe.add("Frence");
    ulkeListe.add("Turkiye");
    ulkeListe.add("Ispanya");
    ulkeListe.add("England");
    ulkeListe.add("Netherland");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("DropDownButton",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: secilenUlke,
              items: ulkeListe.map<DropdownMenuItem<String>>((String ulke) {
                return DropdownMenuItem<String>(
                  value: ulke,
                  child: Text(
                    "ULKE $ulke",
                    style: TextStyle(
                        color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(Icons.arrow_downward),
              onChanged: (String? deger){
                setState(() {
                  secilenUlke = deger!;
                });
              },
            ),
          ],
        ),
      ),

    );
  }
}
