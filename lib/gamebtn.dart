import 'package:flutter/material.dart';

class GameBtn extends StatelessWidget {
  String txt;
  Function onBtnClick;
  int index;

  GameBtn(this.txt, this.index, this.onBtnClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              onBtnClick(index);
            },
            child: Text(
              txt,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
            )));
  }
}
