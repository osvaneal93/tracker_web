import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        minWidth: 300,
        height: 50,
        onPressed: onPressed,
        color: Theme.of(context).colorScheme.onPrimary,
        child: Text(
          label,
          style: styles.mediumStyle(context, color: colors.whiteColor),
        ),
      ),
    );
  }
}
