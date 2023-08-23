import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:minh_demo_bloc/albums/view/view.dart';
import 'package:minh_demo_bloc/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minh Demo Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const AlbumsPage(),
    );
  }
}
