import 'package:flutter/material.dart';

class box1 extends StatelessWidget {
  const box1(this.iconName, this.gender, this.boxColor, this.selectGender);

  final Icon iconName;
  final String gender;
  final Color boxColor;
  final VoidCallback selectGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(onTap: selectGender, child: iconName),
          Text(gender,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
        ],
      ),
    );
  }
}
