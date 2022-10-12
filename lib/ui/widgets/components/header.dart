import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/search_field.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/today_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TodayText(),
        const SizedBox(width: kSpacing),
        Expanded(child: SearchField()),
      ],
    );
  }
}
