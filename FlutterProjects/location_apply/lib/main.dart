import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Completer<GoogleMapController> haritaKontrol = Completer();
  var baslangicKonum = const CameraPosition(target: LatLng(40.541,28.532),zoom: 4);
/*


  var latitude = 0.0;
  var longitude = 0.0;
  Future<void> getCurrentPosition() async{
    LocationPermission permission = await Geolocator.requestPermission();
    Position location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });
  }
  */
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Get Location"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            ElevatedButton(
              child: Text("Get Location"),
              onPressed: (){
                getCurrentPosition();
              },
            ),
            Text("Latitude: $latitude",style: TextStyle(fontSize: 20),),
            Text("Longitude: $longitude",style: TextStyle(fontSize: 20),),
            */
            SizedBox(
              width: 200,
              height: 200,
              child: GoogleMap(
                initialCameraPosition: baslangicKonum,
                mapType: MapType.satellite,
                onMapCreated: (GoogleMapController controller){
                haritaKontrol.complete(controller);
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}
