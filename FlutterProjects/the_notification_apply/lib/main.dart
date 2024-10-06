import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

  late Timer timer;
  int kalanSure = 10;

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async{
    var androidAyari = AndroidInitializationSettings("@mipmap/ic_launcher.png");
    var kurulumAyari = InitializationSettings(android: androidAyari);
    await flp.initialize(kurulumAyari,onDidReceiveNotificationResponse: tapNotification);
  }

  Future<void> tapNotification(NotificationResponse notificationResponse) async{
    var payload = notificationResponse.payload;
    if(payload != null){
      print("Notifications chosed $payload");
    }
  }

  Future<void> bildirimGoster() async{
    var androidBildirimDetay = AndroidNotificationDetails(
      "Kanal ID",
      "Kanal Baslik",
      icon: "@mipmap/ic_launcher.png",
      channelDescription: "Kanal Aciklama",
      priority: Priority.high,
      importance: Importance.max,
    );
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay);
    await flp.show(0, "HEAD", "body", bildirimDetay,payload: "Payload Icerik");
  }

  Future<void> bildirimGecikmeliGoster() async{
    var androidBildirimDetay = AndroidNotificationDetails(
      "Kanal ID",
      "Kanal Baslik",
      channelDescription: "Kanal Aciklama",
      priority: Priority.high,
      importance: Importance.max,
    );
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay);

    tz.initializeTimeZones();

    var delayed = tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

    await flp.zonedSchedule(0, "TITLE", "body", delayed, bildirimDetay,payload: "Gecikmeli Payload",
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Notification"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              bildirimGoster();
            }, child: const Text("Get Notification")),
            ElevatedButton(onPressed: (){
              bildirimGecikmeliGoster();
            }, child: const Text("Get Notification(Delayed)")),
            Text("Kalan Sure: $kalanSure"),
            ElevatedButton(onPressed: (){
              timer = Timer.periodic(Duration(seconds: 1), (timer) {
                setState(() {
                  if(kalanSure<1){
                    kalanSure = 10;
                    timer.cancel();
                  }else{
                    kalanSure -= 1;
                  }
                });
              });
            }, child: const Text("BASLA")),
          ],
        ),
      ),
    );
  }
}