import 'package:flutter/material.dart';
import 'package:sozluk_uygulamasi/Kelimeler.dart';

class Detaysayfa extends StatefulWidget {

  Kelimeler kelime;

  Detaysayfa({required this.kelime});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("${widget.kelime.ingilizce}"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.kelime.ingilizce,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            Text(widget.kelime.turkce,style: TextStyle(fontSize: 40,color: Colors.pink),),
          ],
        ),
      ),
    );
  }
}
