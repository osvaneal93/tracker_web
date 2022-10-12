import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class ProjectCardData {
  final double percent;
  final ImageProvider projectImage;
  final String projectName;
  final DateTime releaseTime;

  const ProjectCardData({
    required this.projectImage,
    required this.projectName,
    required this.releaseTime,
    required this.percent,
  });
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _PercentIndicator(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleText(data.projectName),
              const SizedBox(height: 5),
              Row(
                children: [
                  const _SubtitleText("Release time : "),
                  _ReleaseTimeText(data.releaseTime)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _PercentIndicator extends StatelessWidget {
  const _PercentIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55,
      lineWidth: 2.0,
      percent: .9,
      center: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'logo_soriana.png',
            fit: BoxFit.cover,
          )),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Theme.of(context).colorScheme.primary,
      progressColor: Theme.of(context).colorScheme.onPrimary,
      reverse: true,
    );
  }
}

/* -----------------------------> COMPONENTS <------------------------------ */

class _TitleText extends StatelessWidget {
  const _TitleText(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.capitalize!,
      style: styles.mediumStyle(context, color: colors.whiteColor),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText(this.data, {Key? key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: 11, color: colors.bluePrimary),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ReleaseTimeText extends StatelessWidget {
  const _ReleaseTimeText(this.date, {Key? key}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kNotifColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Text(
        DateFormat.yMMMd().format(date),
        style: const TextStyle(fontSize: 9, color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
