import 'dart:io';
import 'package:bp_kisiler/cubit/anasayfa_cubit.dart';
import 'package:bp_kisiler/entity/kisiler.dart';
import 'package:bp_kisiler/views/kisiDetay.dart';
import 'package:bp_kisiler/views/kisiKayit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';


class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  String aranacakText = "";

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          aramaYapiliyorMu ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
                aranacakText = "";
              });
              context.read<AnasayfaCubit>().kisileriYukle();
            },
          ) :
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          ),
        ],

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: aramaYapiliyorMu ? TextField(
          decoration: InputDecoration(hintText: "Arama icin birsey yazin"),
          onChanged: (aranacak){
              context.read<AnasayfaCubit>().kisiArama(aranacak);
          },
        ) :  Text("Rehber"),
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context,kisiler){
          if(kisiler.isNotEmpty){
            return ListView.builder(
                itemCount: kisiler.length,
                itemBuilder: (context,index){
                  var kisi = kisiler[index];
                  return SizedBox(
                    height: 100,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Detaykisi(kisi))).then((value){
                          context.read<AnasayfaCubit>().kisileriYukle();
                        });
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                            Spacer(),
                            IconButton(
                                onPressed: (){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("${kisi.kisi_ad} silinsin mi?"),
                                      action: SnackBarAction(label: "EVET", onPressed: (){
                                        context.read<AnasayfaCubit>().kisiSil(kisi.kisi_id);
                                      }),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Kisikayit())).then((value){
            context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
        tooltip: 'Kayit',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
