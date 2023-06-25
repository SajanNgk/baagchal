import 'package:baagchal/views/game_screen.dart';
import 'package:baagchal/viewmodals/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameViewModel(),
      child: BaagChaalGame(),
    ),
  );
}

class BaagChaalGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      
      title: 'Baag Chaal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}
