import 'package:flutter/material.dart';

import '../constants.dart';

class TwoTextCard extends StatelessWidget {
  final String title;
  final String content;
  final Color bgColor;
  final Color titleColor;
  final Color contentColor;

  const TwoTextCard({
    super.key,
    required this.title,
    required this.content,
    this.bgColor = Colors.white,
    this.titleColor = Colors.black87,
    this.contentColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.fromBorderSide(
              BorderSide(color: contentColor, width: 1.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kRegularLabelStyle.copyWith(
                fontWeight: FontWeight.w700, color: titleColor, fontSize: 40.0),
          ),
          const SizedBox(height: 10.0),
          Text(
            content,
            style: kThinLabelStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: contentColor,
                fontSize: 36.0),
          )
        ],
      ),
    );
  }
}
