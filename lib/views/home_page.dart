import 'package:flutter/material.dart';
import 'package:quizzler/view_models/home_page_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  static const kTestStyle = TextStyle(color: Colors.white, fontSize: 20.0);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomePageModel();
  var answerIcons = List<Icon>();
  void onPressed(bool userAnswer) {
    if (viewModel.isLast()) {
      Alert(
              context: context,
              title: 'Finished',
              desc: 'You\'ve reached the end of the quiz.')
          .show();
      viewModel.reset();
      answerIcons = [];
    } else {
      final icon = viewModel.currentQuestion().answer == userAnswer
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.close, color: Colors.red);
      answerIcons.add(icon);
      viewModel.goToNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              viewModel.currentQuestion().question,
              style: HomePage.kTestStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text(
                'True',
                style: HomePage.kTestStyle,
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  onPressed(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text(
                'False',
                style: HomePage.kTestStyle,
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  onPressed(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: answerIcons,
        ),
      ],
    );
  }
}
