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

  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Colors.black54,
       
        title: Text("Snack Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Varsayilan"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Merhaba"),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("SnackBar Action"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silmek Ister misin?"),
                    action: SnackBarAction(
                      label: "EVET",
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Silindi"),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Snack Bar Ozel"),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.white54,
                    content: Text(
                      "Baglantiniz Kesildi!",
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    action: SnackBarAction(
                      textColor: Colors.red,
                      label: "TEKRAR DENE",
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("TEKRAR DENENDI"),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Alert Dialog"),
              onPressed: (){
               showDialog(
                   context: context,
                   builder: (BuildContext context){

                     return AlertDialog(
                       backgroundColor: Colors.deepOrangeAccent,
                       title: Text("Baslik",style: TextStyle(color: Colors.white),),
                       content: TextField(
                         controller: tfControl,
                         decoration: InputDecoration(
                           labelText: "Veri",
                         ),
                       ),
                       actions: [
                         TextButton(
                           child: Text("Iptal",style: TextStyle(color: Colors.white),),
                           onPressed: (){
                             Navigator.pop(context);
                           },
                         ),
                         TextButton(
                           child: Text("Veriyi Oku",style: TextStyle(color: Colors.white),),
                           onPressed: (){
                             var alinanVeri = tfControl.text;
                             print("Alinan Veri: $alinanVeri");
                             tfControl.text = "";
                             Navigator.pop(context);
                           },
                         ),
                       ],
                     );

               },
               );
              },
            ),
            PopupMenuButton(
              child: Icon(Icons.open_in_new),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Yenile",style: TextStyle(color: Colors.pink),),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Sil",style: TextStyle(color: Colors.pink),),
                ),
              ],
              onCanceled: (){
                print("Secim Yapilmadi!");
              },
              onSelected: (menuItemValue){
                if( menuItemValue == 1 ){
                  print("Yenilendi");
                }
                if( menuItemValue == 2 ){
                  print("Silindi");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
