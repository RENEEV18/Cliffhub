import 'package:cliffhub/core/constants/const.dart';
import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  const MainTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'C',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 191, 0),
          fontSize: 35,
          fontFamily: 'FredokaOne',
        ),
        children: [
          TextSpan(
            text: 'l',
            style: kTextStyle,
          ),
          TextSpan(text: 'iff', style: kTextStyle),
          TextSpan(
            text: 'h',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 191, 0),
                fontSize: 30,
                fontFamily: 'FredokaOne'),
          ),
          TextSpan(text: 'ub', style: kTextStyle),
        ],
      ),
    );
  }
}
