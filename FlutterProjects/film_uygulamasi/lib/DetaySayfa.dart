import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {

  Filmler film;


  Detaysayfa(this.film);

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.film.film_adi,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.film.film_resim_adi}"),
            Text("${widget.film.film_fiyati} \u{20BA}",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 48,color: Colors.blue),),
            ElevatedButton(
              child: Text("Kirala",style: TextStyle(fontSize: 36),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: (){
                print("${widget.film.film_adi} kiralandi.");
              },
            ),
          ],
        ),
      ),
    );
  }
}
