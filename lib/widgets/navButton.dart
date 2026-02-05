import 'package:flutter/material.dart';

class NavButtonRound extends StatefulWidget {
  final IconData navIcon;
  final Function onPress;
  bool selected;
  bool isPrimary;

  NavButtonRound({
    super.key,
    required this.navIcon,
    required this.onPress,
    this.selected = false,
    this.isPrimary = false,
  });

  @override
  State<NavButtonRound> createState() => _NavButtonRoundState();
}

class _NavButtonRoundState extends State<NavButtonRound> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(widget.isPrimary
            ? Colors.white
            : (widget.selected ? Colors.teal.shade900 : Colors.black54)),
        backgroundColor: WidgetStateProperty.all(
            widget.isPrimary ? Colors.teal.shade900 : Colors.transparent),
        shape: WidgetStateProperty.all<CircleBorder>(
          const CircleBorder(),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () => widget.onPress(),
      child: SizedBox(
        width: 50.0, // Set a width for the circle button
        height: 50.0, // Set a height for the circle button
        child: Center(
          // Center the icon inside the button
          child: Icon(
            widget.navIcon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
