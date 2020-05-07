import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/single_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GENDER { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GENDER selectedGender;
  int height = 180;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SingleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GENDER.MALE;
                      });
                    },
                    color: selectedGender == GENDER.MALE
                        ? kActiveColor
                        : kInactiveColor,
                    carChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: SingleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GENDER.FEMALE;
                      });
                    },
                    color: selectedGender == GENDER.FEMALE
                        ? kActiveColor
                        : kInactiveColor,
                    carChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleCard(
              color: kActiveColor,
              carChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      disabledThumbColor: kActiveColor,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SingleCard(
                    color: kActiveColor,
                    carChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              "kg",
                              style: kLabelStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            IconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: SingleCard(
                  color: kActiveColor,
                  carChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          IconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              var calculate = Calculator(height: height, weight: weight);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                      calculatedBMI: calculate.calculateBMI(),
                      result: calculate.getResult(),
                      interpretation: calculate.getInterpretation()),
                ),
              );
            },
            buttonTitle: 'Calculate',
          )
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  IconButton({this.icon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      elevation: 6.0,
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
    );
  }
}

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  IconContent({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
