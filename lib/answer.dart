import 'package:flutter/material.dart';

class  Answer extends StatelessWidget {
  final String textstr;
  final Function handler;
  final bool clicked;
  Answer(this.textstr,this.handler,this.clicked);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          highlightElevation: 20,
          onPressed: handler,
          color: clicked?Colors.green:Colors.grey,
          splashColor: Colors.pink,
          focusColor: Colors.black,
         
          hoverColor: Colors.green,
          highlightColor: Colors.green,
          child: Text(
            textstr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
    );
  }
}