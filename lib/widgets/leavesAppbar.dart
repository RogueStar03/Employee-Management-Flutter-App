import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LeavesAppBar extends StatelessWidget {
  const LeavesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('All Leaves',
                style: kRegularTitleStyle.copyWith(fontSize: 42.0))
          ],
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.add_circled,
              size: 30.0,
              color: Colors.black87,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.more_horiz_rounded,
              size: 30.0,
              color: Colors.black87,
            )
          ],
        )
      ],
    );
  }
}
