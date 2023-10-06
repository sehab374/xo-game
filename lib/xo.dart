import 'package:flutter/material.dart';
import 'package:xo/playersmodel.dart';
import 'gamebtn.dart';

class XoGame extends StatefulWidget {
  static const String routeName = "game";

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  int score1 = 0;
  int score2 = 0;

  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int counter = 1;

  onBtnClick(index) {
    if (board[index].isNotEmpty) return;
    if (counter.isOdd) {
      board[index] = "X";
      score1 += 2;
      bool win = checkWinner("X");
      if (win) {
        print("XXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        score1 += 10;
        resetBoard();
      }
    } else {
      board[index] = "O";
      score2 += 2;
      bool win = checkWinner("O");
      if (win) {
        print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
        score2 += 10;
        resetBoard();
      }
    }

    ////////////////////in case of no one win and all board fill
    if (counter == 9) resetBoard();

    /////////////////////to change from X to O
    counter++;
    setState(() {});
  }

  bool checkWinner(String player) {
    ///////////////////rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player &&
          board[i + 1] == player &&
          board[i + 2] == player) {
        return true;
      }
    }
    ///////////////column
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }
    ///////diagonales
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }

    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }

    return false;
  }

  resetBoard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    ////////to start from x every round
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {


    ////////////catch player names

    PlayersModel args =
        ModalRoute.of(context)?.settings.arguments as PlayersModel;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text("XO Game"),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${args.name1}(X)",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  Text("$score1",
                      style: TextStyle(color: Colors.pink, fontSize: 20))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${args.name2}(O)",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  Text("$score2",
                      style: TextStyle(color: Colors.pink, fontSize: 20))
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameBtn(board[0], 0, onBtnClick),
              GameBtn(board[1], 1, onBtnClick),
              GameBtn(board[2], 2, onBtnClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameBtn(board[3], 3, onBtnClick),
              GameBtn(board[4], 4, onBtnClick),
              GameBtn(board[5], 5, onBtnClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameBtn(board[6], 6, onBtnClick),
              GameBtn(board[7], 7, onBtnClick),
              GameBtn(board[8], 8, onBtnClick),
            ],
          ),
        )
      ]),
    ));
  }
}
