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
  var tfController = TextEditingController();
  var alinanVeri = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueGrey,

        title: Text("Anasayfa"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                controller: tfController,
                decoration: InputDecoration(
                  hintText: "Yaziniz",
                  hintStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),

              ),
            ),
            ElevatedButton(
              child: Text("Veriyi Al"),
              onPressed: (){
                setState(() {
                  alinanVeri = tfController.text;
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.greenAccent,
                shadowColor: Colors.black,
                elevation: 10,
              ),
            ),
            Text(
              "Alinan Veri: $alinanVeri",
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,

              ),
            ),
            FloatingActionButton(
              onPressed: (){
                print("FAB2 Tiklandi");
              },
              tooltip: "FIDLONA",
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.pink,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          print("FAB1 Tiklandi");
        },
        tooltip: "FIDLONA",
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
        label: Text("FAD1"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
