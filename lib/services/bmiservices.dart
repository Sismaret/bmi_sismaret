import 'package:bmi_sismaret/library/bmicalc.dart';
import 'package:bmi_sismaret/repository/interpretation.dart';
import 'package:bmi_sismaret/repository/result.dart';

class bmiservices {
  final int _weight;
  final int _height;

  bmiservices(this._weight, this._height);

  int getScore() {
    bmicalc bmiResult = bmicalc(_weight, _height);
    return bmiResult.calculateBMI();
  }

  String getInterpretation(int score) {
    interpretation _inter = interpretation();
    if (score >= 25) {
      return _inter.getInterpretation(0);
    } else if (score >= 18.5) {
      return _inter.getInterpretation(1);
    } else {
      return _inter.getInterpretation(2);
    }
  }

  String getResult(int score) {
    result _result = result();
    if (score >= 25) {
      return _result.getResult(0);
    } else if (score >= 18.5) {
      return _result.getResult(1);
    } else {
      return _result.getResult(2);
    }
  }
}
