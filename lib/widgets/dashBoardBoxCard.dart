import 'package:flutter/material.dart';

import '../constants.dart';

class DashBoardBoxCard extends StatelessWidget {
  final Icon buttonIcon;
  final String cardTitle;
  final String cardDataPrimary;
  final String cardDataSecondary;

  const DashBoardBoxCard(
      {super.key,
      required this.buttonIcon,
      required this.cardTitle,
      required this.cardDataPrimary,
      required this.cardDataSecondary});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: TextButton(
                      onPressed: () {},
                      style: kRoundedRectangleButton,
                      child: buttonIcon,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        cardTitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 26.0, fontFamily: 'Dongle'),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                cardDataPrimary,
                style: kRegularLabelStyle.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10.0),
              Text(
                cardDataSecondary,
                style: kThinLabelStyle.copyWith(fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
