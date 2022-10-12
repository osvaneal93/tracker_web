import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final BuildContext context;
  final bool? obscureText;

  const CustomTextfield({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
    required this.context,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: styles.mediumStyle(context, color: colors.whiteColor)),
            TextFormField(
              validator: validator,
              obscureText: obscureText!,
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                errorStyle: styles.tinyStyle(context, color: colors.whiteColor),
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: colors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
