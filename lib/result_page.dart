import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/single_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String calculatedBMI;
  final String result;
  final interpretation;

  const ResultScreen(
      {@required this.calculatedBMI,
      @required this.result,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleCard(
              color: kActiveColor,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.result.toUpperCase(),
                    style: TextStyle(color: Color(0xFF24D876), fontSize: 25),
                  ),
                  Text(
                    calculatedBMI,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.5),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            buttonTitle: "Re-Calculate",
          )
        ],
      ),
    );
  }
}
