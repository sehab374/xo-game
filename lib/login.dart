import 'package:flutter/material.dart';
import 'package:xo/playersmodel.dart';
import 'package:xo/xo.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  // String name1 = "";
  // String name2 = "";

  TextEditingController name1controller = TextEditingController();
  TextEditingController name2controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome !"),
          centerTitle: true,
          backgroundColor: Colors.pink),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // onChanged: (value) {
            //   name1=value;
            // },
            controller: name1controller,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                labelText: "player1 name",
                labelStyle: TextStyle(color: Colors.pinkAccent),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 3)),
                suffixIcon: Icon(Icons.attach_file, color: Colors.pink),
                prefixIcon: Icon(Icons.emoji_emotions, color: Colors.pink),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // onChanged: (value) {
            //   name2=value;
            // },
            controller: name2controller,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "player2 name",
                labelStyle: TextStyle(color: Colors.pinkAccent),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 3)),
                suffixIcon: Icon(Icons.attach_file, color: Colors.pink),
                prefixIcon: Icon(Icons.emoji_emotions, color: Colors.pink),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, XoGame.routeName,
                  arguments:
                      PlayersModel(name1controller.text, name2controller.text));
              name1controller.text = "";
              name2controller.text = "";
            },
            child: Text("Lets Go", style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white10),
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30)))
      ]),
    );
  }
}
