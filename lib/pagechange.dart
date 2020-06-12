import 'package:flutter/material.dart';

class  PageChange extends StatelessWidget {
  final String textstr;
  final Function handler;
  PageChange(this.textstr,this.handler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(minWidth: 100,padding: EdgeInsets.all(10),
      child:RaisedButton(
          onPressed:  handler,
          color: Colors.lightBlue,
          
          
          hoverColor: Colors.blue,
          highlightColor: Colors.blue,
          child: Text(
            textstr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}