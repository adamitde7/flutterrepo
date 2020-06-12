import 'package:first_app/questions.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pagechange.dart';
import 'package:first_app/answer.dart';
import 'package:first_app/result.dart';

void main() {
  runApp(MyFlutterApp());
}

class MyFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFlutterAppState();
  }
}

class _MyFlutterAppState extends State<MyFlutterApp> {
  bool yclicked = false;
  bool nclicked = false;
  final questions = [
    {
      'ques': 'China made Covid-19?',
      'ans': ['Yes', 'No', 'May Be'],
      'clicked': [false, false, false]
    },
    {
      'ques': 'Should China pay?',
      'ans': ['Yes', 'No'],
      'clicked': [false, false]
    },
    {
      'ques': 'Is WW3 near?',
      'ans': ['Yes', 'No'],
      'clicked': [false, false]
    },
  ];
  var answ = new Map();
  int index = 0;
  bool isSubmit = false;
  void _answer(String ans) {
    if (ans == "Next") {
      setState(() {
        if (index != questions.length - 1) {
          index++;
          yclicked = false;
          nclicked = false;
        }
      });
    }
    if (ans == "Previous") {
      setState(() {
        if (index != 0) {
          index--;
          yclicked = false;
          nclicked = false;
        }
      });
    }
    if (ans == 'Submit') {
      setState(() {
        isSubmit = true;
      });
    } else {
      String que = questions[index]['ques'];
      print(index);
      print(que);
      answ[que] = ans;
      print(answ);
      setState(() {
        int ansindex = (questions[index]['ans'] as List).indexOf(ans);
        print(questions[index]['clicked']);
        if ((questions[index]['clicked'] as List)[ansindex]) {
          (questions[index]['clicked'] as List)[ansindex] = false;
        } else {
          (questions[index]['clicked'] as List)[ansindex] = true;
        }

        print(questions[index]['clicked']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var preback = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PageChange('Previous', () => _answer('Previous')),
        PageChange('Next', () => _answer('Next'))
      ],
    );
    var buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...(questions[index]['ans'] as List).map((ans) {
          int ansind = (questions[index]['ans'] as List).indexOf(ans);
          bool isClicked = (questions[index]['clicked'] as List)[ansind];
          return Answer(ans, () => _answer(ans), isClicked);
        }).toList(),
      ],
    );
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: (isSubmit == true)
              ? Center(
                  child: Text(
                  'Thanks for the Survey',
                  style: TextStyle(fontSize: 30),
                  softWrap: true,
                ))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Question(questions[index]['ques']),
                      buttons,
                      preback,
                      Result('Submit', () => _answer('Submit'))
                    ])),
    );
  }
}
