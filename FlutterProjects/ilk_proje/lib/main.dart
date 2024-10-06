import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    var ekranYuksekligi = ekranBilgisi.size.height;
    var ekranGenisligi = ekranBilgisi.size.width;
    return  Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: ekranGenisligi/2,
                height: ekranYuksekligi/4,
                  child:
                    Image.asset("resimler/logo.png")
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi/30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Kullanici Adi",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0),
                    ),
                  )
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranGenisligi/30),
              child: TextField(
                obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Sifre",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0),
                        ),
                      )
                  )
                ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/30),
              child: SizedBox(
                width: ekranGenisligi/1.2,
                height: ekranYuksekligi/12,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text(
                      "Giris Yap",style: TextStyle(fontSize: ekranGenisligi/15),
                  ),
                  onPressed: (){
                    print("Giris Yapildi");
                  }
          
                ),
              ),
            ),
              GestureDetector(
                onTap: (){
                  print("Yardim Secildi!");
                },
                child: Text("YARDIM",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ekranGenisligi/20,
                  color: Colors.black,
                ),),
              )
            ],
          ),
        ),
      ),

    );
  }
}
