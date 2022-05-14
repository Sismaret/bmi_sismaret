class interpretation {
  List listData = [
    'You have a higher than normal body weight. Try to exercise more.',
    'You have a normal body weight. Good job!',
    'You have a lower than normal body weight. You can eat a bit more.'
  ];

  String getInterpretation(int result) {
    return listData[result];
  }
}
