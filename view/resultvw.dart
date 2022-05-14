import 'package:flutter/material.dart';

class resultvw extends StatelessWidget {
  const resultvw(this.status, this.score, this.comment);

  final String status;
  final double score;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(9, 1, 13, 0.875),
        shadowColor: const Color.fromRGBO(9, 1, 13, 0.875),
      ),
      body: Center(
        child: Column(children: [
          Row(
            children: const [
              Text('Your Result',
                  style: TextStyle(color: Colors.greenAccent, fontSize: 30))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 184, 184, 181),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          status,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          score.toString(),
                          style: const TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          comment,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
      backgroundColor: const Color.fromRGBO(9, 1, 13, 0.875),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
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
                'RE-CALCULATE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
