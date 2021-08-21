import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/utils/utils.dart';
import './quiz.dart';
import 'package:quiz_app/utils/utils.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _question = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Lion', 'score': 11},
        {'text': 'Cat', 'score': 5},
        {'text': 'Dog', 'score': 9}
      ],
    },
    {
      'questionText': 'What\'s your favorite Language?',
      'answers': [
        {'text': 'C++', 'score': 2},
        {'text': 'Java', 'score': 11},
        {'text': 'Dart', 'score': 5},
        {'text': 'Javascript', 'score': 7}
      ],
    }
  ];
  var _questionindex = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {
      _questionindex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
    setState(() {
      _questionindex = _questionindex + 1;
    });
    if (_questionindex < _question.length) {
      print('We have more question!');
    }
    print(_questionindex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: quizcolor.bodycolor,
          appBar: AppBar(
            backgroundColor: quizcolor.primaryColor1,
            title: Text('Quiz App'),
          ),
          body: _questionindex < _question.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionindex,
                  question: _question,
                )
              : Result(_totalscore, _resetQuiz)),
    );
  }
}
