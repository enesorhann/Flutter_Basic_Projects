import 'package:bp_kisiler/cubit/anasayfa_cubit.dart';
import 'package:bp_kisiler/cubit/detay_cubit.dart';
import 'package:bp_kisiler/cubit/kayit_cubit.dart';
import 'package:bp_kisiler/firebase_options.dart';
import 'package:bp_kisiler/views/anasayfa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KayitCubit()),
        BlocProvider(create: (context) => DetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Anasayfa(),
      ),
    );
  }
}
