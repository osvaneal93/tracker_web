import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class ProgressReportCardData {
  final double percent;
  final String title;
  final int task;
  final int doneTask;
  final int undoneTask;

  const ProgressReportCardData({
    required this.percent,
    required this.title,
    required this.task,
    required this.doneTask,
    required this.undoneTask,
  });
}

class ProgressReportCard extends StatelessWidget {
  const ProgressReportCard({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProgressReportCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.greenPrimary,
            colors.sorianaGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                style: styles.mediumStyle(context,
                    color: colors.whiteColor, bold: true),
              ),
              const SizedBox(height: 15),
              _RichText(value1: "${data.task} ", value2: "Visitas"),
              const SizedBox(height: 3),
              _RichText(value1: "${data.doneTask} ", value2: "Visitas Listas"),
              const SizedBox(height: 3),
              _RichText(
                  value1: "${data.undoneTask} ", value2: "Visitas Pendientes"),
            ],
          ),
          const Spacer(),
          _Indicator(percent: data.percent),
        ],
      ),
    );
  }
}

class _RichText extends StatelessWidget {
  const _RichText({
    required this.value1,
    required this.value2,
    Key? key,
  }) : super(key: key);

  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: kFontColorPallets[0],
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        children: [
          TextSpan(text: value1),
          TextSpan(
            text: value2,
            style: TextStyle(
              color: kFontColorPallets[0],
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.percent, Key? key}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      lineWidth: 15,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text((percent * 100).toString() + " %",
              style: styles.smallStyle(context,
                  bold: true, color: colors.whiteColor)),
          Text("Completado",
              style: styles.extraTinyStyle(context, color: colors.whiteColor)),
        ],
      ),
      progressColor: colors.orangePrimary,
      backgroundColor: colors.orangePrimary.withOpacity(.7),
    );
  }
}
