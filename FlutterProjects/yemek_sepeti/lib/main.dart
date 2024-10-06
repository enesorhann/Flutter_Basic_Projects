import 'package:flutter/material.dart';
import 'package:yemek_sepeti/DetaySayfa.dart';
import 'package:yemek_sepeti/Yemekler.dart';

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

  Future<List<Yemekler>> getData() async{
    var yemekListesi = <Yemekler>[];
    var y1 = Yemekler(1, "Köfte", "kofte.png", 15.99);
    var y2 = Yemekler(2, "Ayran", "ayran.png", 2.0);
    var y3 = Yemekler(3, "Fanta", "fanta.png", 3.0);
    var y4 = Yemekler(4, "Makarna", "makarna.png", 14.99);
    var y5 = Yemekler(5, "Kadayıf", "kadayif.png", 8.50);
    var y6 = Yemekler(6, "Baklava", "baklava.png", 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.red,

        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekler = snapshot.data;
            return ListView.builder(
              itemCount: yemekler?.length,
              itemBuilder: (context,index){
                var yemek = yemekler![index];
                return Card(
                  child: Row(
                    children: [
                      SizedBox(height: 150, child: Image.asset("resimler/${yemek.yemekResimAdi}")),
                      Column(
                        children: [
                          Text(yemek.yemekAdi,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          SizedBox(height: 50,),
                          Text("${yemek.yemek_fiyati} \u{20BA}",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(yemek)));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
