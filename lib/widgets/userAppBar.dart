import 'package:ams_android/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAppbar extends StatelessWidget {
  const UserAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20.0,
              child: Icon(
                Icons.account_circle,
                size: 40.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee Name',
                    style: kRegularLabelStyle,
                  ),
                  Text('Employee Position', style: kThinLabelStyle)
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50, // Adjust height as needed
              child: VerticalDivider(
                color: Colors.grey, // Customize color as per your design
                thickness: 1, // Thickness of the divider
                width: 20, // Spacing between buttons
              ),
            ),
            Icon(
              CupertinoIcons.bell,
            ),
          ],
        )
      ],
    );
  }
}
