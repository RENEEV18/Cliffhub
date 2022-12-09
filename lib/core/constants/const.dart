import 'package:flutter/material.dart';

const kBlack = Colors.black;
const klightBlack = Colors.grey;
const kWhite = Colors.white;
const kGrey = Color.fromARGB(255, 54, 54, 54);
final kContainer = Colors.black.withOpacity(0.2);
const kYellow = Colors.amber;
const kCreateColor = Color.fromARGB(255, 248, 190, 17);
const kBlue = Colors.blue;

// const colour.

// styles
const kTextStyle = TextStyle(
    color: kBlack,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'FredokaOne');

const kSubTextStyle = TextStyle(color: kBlack, fontFamily: 'Manrope');
const kUsernameStyle =
    TextStyle(color: Color.fromARGB(148, 0, 0, 0), fontSize: 15);

// sizes
const kSize = SizedBox(
  height: 20,
);
const kContainerSize = SizedBox(
  height: 10,
);
const kWidth = SizedBox(
  width: 10,
);

//String
const String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
