import 'package:flutter/material.dart';

class Result  extends StatelessWidget {
  final String textStr;
  final Function handler;
  Result(this.textStr, this.handler);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: RaisedButton(onPressed: handler,
          color: Colors.blue,
          
          
          hoverColor: Colors.blue,
          highlightColor: Colors.blue,
          child: Text(
            textStr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
    );
  }
}