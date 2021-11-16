import 'dart:math';
import 'dart:ui';
import 'package:tiengkanimals/Views/game_view.dart';
import 'package:flutter/material.dart';
import 'package:tiengkanimals/Controllers/game_controller.dart';
import 'package:momentum/momentum.dart';
void main() {
  runApp(Momentum(controllers: [GameController()],child: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(  backgroundColor: Colors.blue[100],
       appBar:AppBar(title: Center(child:Text("Game Animals")),) ,
        body: GameView(),
      ),
    );
  }
}
