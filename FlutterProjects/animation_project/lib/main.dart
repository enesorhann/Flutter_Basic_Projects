import 'dart:math';

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> alphaAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> rotateAnimation;
  late Animation<double> translateAnimation;
  bool fabDurum = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    alphaAnimation = Tween(begin: 0.0,end: 1.0).animate(animationController)..addListener((){
      setState(() {});
    });
    scaleAnimation = Tween(begin: 128.0,end: 192.0).animate(animationController)..addListener((){
      setState(() {});
    });
    rotateAnimation = Tween(begin: pi,end: pi/4).animate(animationController)..addListener((){
      setState(() {});
    });
    translateAnimation = Tween(begin: -50.0,end: 0.0).
    animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut))..addListener((){
      setState(() {});
    });
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(

        backgroundColor: Colors.deepPurple,

        title: Text("Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Opacity(
                opacity: alphaAnimation.value,
                child: Transform.translate(
                  offset: Offset(translateAnimation.value,0.0),
                  child: Icon(Icons.wb_cloudy,size: scaleAnimation.value,))),
            Text("Hava Durumu",style: TextStyle(fontSize: 30),),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                child: Text("BASLA",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                onPressed: (){
                  animationController.repeat(reverse: true);
                },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Opacity(
              opacity: alphaAnimation.value,
              child: FloatingActionButton(
                onPressed: (){
                  print("FAB 1 TIKLANDI");
                },
                tooltip: "FAB 1",
                backgroundColor: Colors.yellow,
                child: Icon(Icons.mode_edit),
              ),
            ),
            Opacity(
              opacity: alphaAnimation.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                    print("FAB 2 TIKLANDI");
                  },
                  tooltip: "FAB 2",
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.phone),
                ),
              ),
            ),
            Transform.rotate(
              angle: rotateAnimation.value,
              child: FloatingActionButton(
                onPressed: (){
                  if(fabDurum){
                    animationController.reverse();
                    fabDurum=false;
                  }else{
                    animationController.forward();
                    fabDurum=true;
                  }
                },
                tooltip: "FAB 3",
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
    );
  }
}
