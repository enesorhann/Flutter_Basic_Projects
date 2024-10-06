import 'package:film_uygulamasi/DetaySayfa.dart';
import 'package:film_uygulamasi/Filmler.dart';
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

  Future<List<Filmler>> getData() async{
    var filmListesi = <Filmler>[];

    var f1 = Filmler(1, "Anadoluda", "anadoluda.png", 15.99);
    var f2 = Filmler(2,"Django","django.png",9.99);
    var f3 = Filmler(3,"Inception","inception.png",7.99);
    var f4 = Filmler(4,"Interstellar","interstellar.png",21.99);
    var f5 = Filmler(5,"The Hateful Eight","thehatefuleight.png",5.99);
    var f6 = Filmler(6,"The Pianist","thepianist.png",17.99);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Filmler"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmler = snapshot.data;

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3.5,
                ),
                itemCount: filmler?.length,
              itemBuilder: (context,index){
                  var film = filmler![index];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(film)));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("resimler/${film.film_resim_adi}"),
                          ),
                          Text(film.film_adi,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text("${film.film_fiyati} \u{20BA}",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                        ],
                      ),
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
