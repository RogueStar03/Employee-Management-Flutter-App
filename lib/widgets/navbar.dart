import 'package:flutter/material.dart';

import 'navButton.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavButtonRound(
          navIcon: Icons.home_filled,
          onPress: () {},
          selected: true,
        ),
        NavButtonRound(
          navIcon: Icons.calendar_today,
          onPress: () {},
        ),
        NavButtonRound(
          navIcon: Icons.people,
          isPrimary: true,
          onPress: () {},
        ),
        NavButtonRound(
          navIcon: Icons.beach_access_rounded,
          onPress: () {},
        ),
        NavButtonRound(
          navIcon: Icons.person,
          onPress: () {},
        ),
      ],
    );
  }
}
