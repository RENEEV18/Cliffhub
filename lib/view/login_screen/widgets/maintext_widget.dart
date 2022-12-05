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
        style: kTextStyle,
        children: [
          TextSpan(
            text: 'l',
            style: TextStyle(
                color: Colors.amber, fontSize: 30, fontFamily: 'FredokaOne'),
          ),
          TextSpan(text: 'iff', style: kTextStyle),
          TextSpan(
            text: 'h',
            style: TextStyle(
                color: Colors.amber, fontSize: 30, fontFamily: 'FredokaOne'),
          ),
          TextSpan(text: 'ub', style: kTextStyle),
        ],
      ),
    );
  }
}
