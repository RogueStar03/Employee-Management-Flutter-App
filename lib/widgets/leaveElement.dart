import 'package:flutter/material.dart';

import '../constants.dart';

class LeaveElement extends StatelessWidget {
  final Icon buttonIcon;
  final String cardTitle;
  final String timeText;
  final String dateText;
  final String descText;

  const LeaveElement(
      {super.key,
      required this.buttonIcon,
      required this.cardTitle,
      required this.timeText,
      required this.dateText,
      required this.descText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center everything vertically
          children: [
            // Title and secondary data on the left side
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              children: [
                Text(
                  'Date',
                  style: kThinLabelStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                Text(
                  cardTitle,
                  style: const TextStyle(
                    fontSize: 28.0,
                    height: 0.9,
                    fontFamily: 'Dongle',
                  ),
                ),
              ],
            ),

            // Spacer to push the primary and secondary data to the right
            const Spacer(),

            // Primary and secondary data on the right side
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              children: [
                Text(
                  timeText,
                  style: kRegularLabelStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 0.9,
                    fontSize: 28.0,
                  ),
                ),
                Text(
                  descText,
                  style: kThinLabelStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
