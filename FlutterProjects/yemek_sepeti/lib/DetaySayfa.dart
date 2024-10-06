import 'package:flutter/material.dart';
import 'package:yemek_sepeti/Yemekler.dart';

class Detaysayfa extends StatefulWidget {

  Yemekler yemek;


  Detaysayfa(this.yemek);

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.red,

        title: Text(widget.yemek.yemekAdi,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.yemek.yemekResimAdi}"),
            Text("${widget.yemek.yemek_fiyati} \u{20BA}",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),
            TextButton(
              child: Text("Sipariş Ver",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: (){
                print("${widget.yemek.yemekAdi} siparisi verildi");
              },
            ),
          ],
        ),
      ),
    );
  }
}
