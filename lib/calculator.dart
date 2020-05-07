import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double _bmi;

  Calculator({this.height, this.weight});

  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    this._bmi = bmi;
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    return _bmi >= 25 ? 'Overweight' : _bmi >= 18.5 ? "Normal" : "Underweight";
  }

  String getInterpretation() {
    return _bmi >= 25
        ? 'You have a higher than normal body weight. Try to exercise more.'
        : _bmi >= 18.5
            ? "You have a normal body weight. Good job!"
            : "You have a lower than a normal body weight. Try to eat a bit more.";
  }
}
