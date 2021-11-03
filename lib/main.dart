import 'package:flutter/material.dart';

import 'homepage.dart';

void main() => runApp(TicTacToeApp());


class TicTacToeApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(  
        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage()
    );
  }
}

