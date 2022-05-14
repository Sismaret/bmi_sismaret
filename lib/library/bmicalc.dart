import 'dart:math';

class bmicalc {
  bmicalc(this._weight, this._height);
  final int _weight;
  final int _height;

  int calculateBMI() {
    double _result = _weight / pow(_height / 100, 2);
    return _result.toInt();
  }
}
