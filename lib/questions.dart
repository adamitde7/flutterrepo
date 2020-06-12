import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final question;
  Question(this.question);
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.all(10),width:double.infinity,padding: EdgeInsets.all(5),color: Colors.grey,child:Text(question,style: TextStyle(
              shadows: [Shadow(color: Colors.lightBlue)],
              color: Colors.black,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          )
    );
      
    
  }
}