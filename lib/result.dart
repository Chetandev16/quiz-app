import 'package:flutter/material.dart';
import 'package:quiz_app/utils/utils.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;
  @override
  Result(this.resultscore, this.resetHandler);

  String get rphrase {
    var resulttext = 'You Did It!';
    if (resultscore <= 8) {
      resulttext = 'You Are Innocent and Awesome!';
    } else if (resultscore <= 12) {
      resulttext = 'Pretty Likeable!';
    } else if (resultscore <= 16) {
      resulttext = 'You are Strange!';
    } else {
      resulttext = 'You are so bad';
    }

    return resulttext;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            rphrase,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: quizcolor.textcolor),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            textColor: Colors.white,
            color: quizcolor.optioncolor,
          )
        ],
      ),
    );
  }
}
