import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soriana_tracker/core/utils/colors.dart';
import 'package:soriana_tracker/core/utils/styles.dart';

class TodayText extends StatelessWidget {
  const TodayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: styles.smallStyle(context, color: colors.whiteColor),
          ),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            style: styles.tinyStyle(context,
                color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
