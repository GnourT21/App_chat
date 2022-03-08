import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  constraints: BoxConstraints(
    maxWidth: double.infinity,
    maxHeight: 80,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(135, 255, 96, 96), width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  hintStyle: TextStyle(
    color: Colors.black26,
    fontSize: 14,
    letterSpacing: 1.4,
  ),
  filled: true,
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0x89F39F8A), width: 1),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kGradientColor = LinearGradient(
  colors: [Color(0xffF2BC71), Color(0xffF49196)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kShadow = BoxShadow(
  color: Colors.black12,
  offset: Offset(4.0, 4.0),
  blurRadius: 12.0,
  spreadRadius: -6.0,
);

const kTextTitle60 = TextStyle(
  fontSize: 60,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

const kTitleBold = TextStyle(
  fontSize: 18,
  color: Colors.black45,
  fontWeight: FontWeight.bold,
);
const kTitleRegular = TextStyle(
  fontSize: 18,
  color: Colors.black45,
  fontWeight: FontWeight.w500,
);
