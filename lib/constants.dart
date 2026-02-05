import 'package:flutter/material.dart';

const kRegularTitleStyle = TextStyle(
    fontSize: 70.0, fontWeight: FontWeight.w500, fontFamily: 'Dongle');

const kTextFieldHintTextStyle = TextStyle(
    fontWeight: FontWeight.w300, color: Colors.black54, fontFamily: 'Dongle');

final kTextFieldFocusedBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.tealAccent.shade400, width: 2.0),
);

final kFilledColorButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(Colors.tealAccent.shade700),
  foregroundColor: WidgetStateProperty.all(Colors.white),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

const kRegularLabelStyle = TextStyle(
    height: 0.8,
    fontSize: 36.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Dongle');

const kThinLabelStyle = TextStyle(
    height: 0.8,
    fontSize: 28.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Dongle');

final kRoundedRectangleButton = ButtonStyle(
  foregroundColor: WidgetStatePropertyAll(Colors.teal.shade700),
  backgroundColor: WidgetStatePropertyAll(Colors.teal.shade50),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

final kTextFieldBox = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(
    fontFamily: 'Dongle',
    fontWeight: FontWeight.w500,
    fontSize: 28.0,
    color: Colors.teal.shade700,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.auto, // Auto transition
  floatingLabelStyle: const TextStyle(
    fontFamily: 'Dongle',
    fontWeight: FontWeight.w500,
    fontSize: 30.0,
    color: Colors.teal,
  ),
  hintText: '',
  hintStyle: const TextStyle(
    fontFamily: 'Dongle',
    fontWeight: FontWeight.w400,
    fontSize: 28.0,
    color: Colors.grey,
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
// Define the border for the normal state
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
  ),
// Define the border for the focused state
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
  ),
// Define the border when there's an error
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.5),
  ),
// Define the border when focused and there's an error
  focusedErrorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);
