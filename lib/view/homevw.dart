import 'package:bmi_sismaret/services/bmiservices.dart';
import 'package:bmi_sismaret/view/resultvw.dart';
import 'package:bmi_sismaret/widget/Box1.dart';
import 'package:bmi_sismaret/widget/Box2.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(backgroundColor: const Color.fromRGBO(50, 4, 77, 0.89)),
      home: const MyHomePage(
        title: 'BMI Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 0;
  int _height = 0;
  bool _isMale = true;
  bool _isFemale = false;
  int _weight = 60;
  int _age = 30;
  Color _box1Active = const Color.fromARGB(255, 184, 184, 181);
  Color _box1InActive = const Color.fromARGB(255, 55, 56, 57);

  int score = 0;
  String result = '';
  String interpretation = '';

  void bmiCalc(_weight, _height) {
    bmiservices bmiServ = bmiservices(_weight, _height);
    score = bmiServ.getScore();
    result = bmiServ.getResult(score);
    interpretation = bmiServ.getInterpretation(score);
  }

  void selectGender(String gender) {
    setState(() {
      if (gender == 'Male') {
        _isMale = true;
        _isFemale = false;
      } else {
        _isMale = false;
        _isFemale = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(9, 1, 13, 0.875),
        shadowColor: const Color.fromRGBO(9, 1, 13, 0.875),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1,
                    child: box1(
                        const Icon(
                          Icons.male_sharp,
                          size: 100,
                        ),
                        'Male',
                        _isMale ? _box1Active : _box1InActive, () {
                      selectGender('Male');
                    })),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1,
                    child: box1(
                        const Icon(
                          Icons.female_sharp,
                          size: 100,
                        ),
                        'Female',
                        _isFemale ? _box1Active : _box1InActive, () {
                      selectGender('Female');
                    })),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    width: 370,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 184, 184, 181),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _height.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                            const Text('cm')
                          ],
                        ),
                        Slider(
                          min: 0,
                          max: 300,
                          divisions: 300,
                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.grey,
                          value: _sliderValue,
                          onChanged: (double value) {
                            setState(() {
                              _sliderValue = value;
                              _height = _sliderValue.toInt();
                            });
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 2,
                    child: box2(
                        'Weight',
                        _weight.toString(),
                        Icons.add_circle_rounded,
                        Icons.remove_circle_rounded, () {
                      setState(() {
                        _weight++;
                      });
                    }, () {
                      setState(() {
                        _weight--;
                      });
                    })),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 2,
                    child: box2(
                        'Age',
                        _age.toString(),
                        Icons.add_circle_rounded,
                        Icons.remove_circle_rounded, () {
                      setState(() {
                        _age++;
                      });
                    }, () {
                      setState(() {
                        _age--;
                      });
                    })),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(9, 1, 13, 0.875),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          bmiCalc(_weight, _height);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      resultvw(result, score.toDouble(), interpretation)));
        },
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'PROCEED',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
