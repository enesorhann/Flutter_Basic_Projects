import 'package:drawer_yapisi/Sayfa1.dart';
import 'package:drawer_yapisi/Sayfa2.dart';
import 'package:drawer_yapisi/Sayfa3.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var sayfaListe = [Sayfa1(),Sayfa2(),Sayfa3()];
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Drawer"),
      ),
      body: sayfaListe[currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Text("Drawer Apply",style: TextStyle(color: Colors.white,fontSize: 25,),),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text("Sayfa 1"),
              leading: Icon(Icons.looks_one),
              onTap: (){
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa 2"),
              leading: Icon(Icons.looks_two),
              onTap: (){
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Sayfa 3"),
              leading: Icon(Icons.looks_3),
              onTap: (){
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
