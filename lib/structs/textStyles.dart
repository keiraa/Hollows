import 'package:flutter/material.dart';

const kMainTitle = TextStyle(
  color: Color(0xff2ACF1B),
  fontSize: 35,
  fontWeight: FontWeight.w600,
  fontFamily: 'LucidaConsole',
  letterSpacing: 1.5,
);

const kSplashTitle = TextStyle(
  color: Color(0xff2ACF1B),
  fontSize: 40,
  fontWeight: FontWeight.w600,
  fontFamily: 'LucidaConsole',
  letterSpacing: 1.5,
);

const kLoginCredentials = TextStyle(
  color: Color(0xff2ACF1B),
  fontSize: 13,
  fontWeight: FontWeight.w600,
  fontFamily: 'LucidaConsole',
  letterSpacing: 1.5,
);

const kInputField = InputDecoration(
  contentPadding: EdgeInsets.all(3),
  hintText: 'login/register',
  hintStyle: TextStyle(
    color: Color(0xff4a148c),
  ),
  disabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  border: InputBorder.none,
  focusColor: Colors.red,
);