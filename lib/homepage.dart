import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool turn = true;
  bool xWins = false;
  bool oWins = false;
  int i = 0;
  List<String> tiles = ['','','','','','','','',''];
  final String players = '';
  int player1Score = 0;
  int player2Score = 0;
  int boxCount = 0;
  List game = [];
  String winner = '';


  @override 
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Tic Tac Toe'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.blue.shade900,
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int i){
          return GestureDetector(
          onTap: () {
            _clicked(i);
          },
          child: Container(
            margin: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.white),
            boxShadow: [BoxShadow(  
              color: Colors.lightBlue.shade200,
              
            )]),
            child: Center(  
              child: Text(tiles[i], style: TextStyle(fontSize: 50, color: Colors.white)),
            )
          )
          );
        }
          ),
      );
  }
  void _clicked(int i) {
    setState(() {
      if (turn && tiles[i] == ''){
      tiles[i] = 'X';
      boxCount += 1;
      }
      else if (!turn && tiles[i] == ''){
        tiles[i] = 'O';
        boxCount += 1;
      }
      turn = !turn;
       //_getWinner(i, tiles, xWins, winner, oWins);
    });
  }
}
  void _getWinner(i, List game, xWins, winner, oWins) {
    List<List> cases = [
      [0,1,2], [3,4,5],
      [6,7,8], [0,3,6],
      [1,4,7], [2,5,8],
      [0,4,8], [2,4,6],];

    for (List win in cases){
      if (game[win[0]] == 'X' && game[win[1]] == 'X' && game[win[2]] == 'X'){
        xWins = true;
        winner = 'PLAYER X WINS';
      }
      else if (game[win[0]] == 'O' && game[win[1]] == 'O' && game[win[2]] == 'O'){
        oWins = true;
        winner = 'PLAYER O WINS';
        _showWinner(winner);
      }
      else{
        xWins = false;
        oWins = false;
      }
    }
    }

    void _showWinner(String winner){

      var context;
      showDialog(barrierDismissible: false,
      context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(winner),
        );
      });

    }
