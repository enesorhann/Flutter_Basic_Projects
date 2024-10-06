import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify_listener_apply/SayacCubit.dart';
import 'package:notify_listener_apply/costumer_initial.dart';
import 'package:provider/provider.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var tf1 = TextEditingController();
  var tf2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Function Baby"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CubitPage,int>(
                  builder: (context,sonuc){
                    return Text("$sonuc",style: TextStyle(fontSize: 30),);
                  }),
              TextField(
                controller: tf1,
                decoration: InputDecoration(
                  hintText: "Num 1",
                ),
              ),
              TextField(
                controller: tf2,
                decoration: InputDecoration(
                  hintText: "Num 2",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      child: Text("TOTAL"),
                      onPressed: (){
                        String alinanSayi1 = tf1.text;
                        String alinanSayi2 = tf2.text;
                        context.read<CubitPage>().toplamaYap(alinanSayi1, alinanSayi2);
                      }
                  ),
                  ElevatedButton(
                      child: Text("MULTIPLY"),
                      onPressed: (){
                        String alinanSayi1 = tf1.text;
                        String alinanSayi2 = tf2.text;
                        context.read<CubitPage>().carpmaYap(alinanSayi1, alinanSayi2);
                      }
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

