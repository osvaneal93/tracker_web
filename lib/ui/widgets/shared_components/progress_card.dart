import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class ProgressCardData {
  final int totalActive;
  final int totalBranch;
  final int totalInRute;

  const ProgressCardData({
    required this.totalInRute,
    required this.totalActive,
    required this.totalBranch,
  });
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    required this.data,
    required this.onPressedCheck,
    Key? key,
  }) : super(key: key);

  final ProgressCardData data;
  final Function() onPressedCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(10, 30),
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset('very_good.svg')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kSpacing,
              top: kSpacing,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tienes ${data.totalInRute} vehiculos activos",
                  style: styles.smallStyle(context,
                      color: colors.whiteColor, bold: true),
                ),
                Text(
                  "${data.totalActive} en sucursal",
                  style: styles.tinyStyle(context,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                Text(
                  "${data.totalBranch} en ruta",
                  style: styles.tinyStyle(context,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(height: kSpacing),
                ElevatedButton(
                  onPressed: onPressedCheck,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(colors.sorianaGreen),
                  ),
                  child: Text(
                    "Check",
                    style: styles.smallStyle(context, color: colors.whiteColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
