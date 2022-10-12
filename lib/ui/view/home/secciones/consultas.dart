import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class ConsultasView extends StatelessWidget {
  const ConsultasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch_later,
            color: colors.whiteColor,
            size: 60,
          ),
          Text(
            'Sección de consultas en construcción ... ',
            style: styles.largeStyle(
              context,
              color: colors.whiteColor,
              bold: true,
            ),
          ),
        ],
      ),
    );
  }
}
