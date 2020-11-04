import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 4.0, right: 2.0),
          color: kSecondaryColor,
          child: Text(
            'Todo',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(width: 6.0),
        Text(
          'ly',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: kWhiteColor,
          ),
        ),
      ],
    );
  }
}
