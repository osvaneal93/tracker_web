import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/helpers/app_helpers.dart';
import 'package:soriana_tracker/core/utils/colors.dart';
import 'package:soriana_tracker/core/utils/styles.dart';

class OverviewHeader extends StatelessWidget {
  const OverviewHeader({
    required this.onSelected,
    this.axis = Axis.horizontal,
    Key? key,
  }) : super(key: key);

  final Function(TaskType? task) onSelected;
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return (axis == Axis.horizontal)
        ? Row(
            children: [
              Text(
                "Task Overview",
                style: styles.smallStyle(context, color: colors.whiteColor),
              ),
              const Spacer(),
              ..._listButton(
                task: TaskType.inProgress,
                onSelected: (value) {},
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Overview",
                style: styles.smallStyle(context, color: colors.whiteColor),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _listButton(
                    task: TaskType.todo,
                    onSelected: (value) {
                      //todo
                    },
                  ),
                ),
              ),
            ],
          );
  }

  List<Widget> _listButton({
    required TaskType? task,
    required Function(TaskType? value) onSelected,
  }) {
    return [
      _button(
        selected: task == null,
        label: "All",
        onPressed: () {
          task = null;
          onSelected(null);
        },
      ),
      _button(
        selected: task == TaskType.todo,
        label: "To do",
        onPressed: () {
          task = TaskType.todo;
          onSelected(TaskType.todo);
        },
      ),
      _button(
        selected: task == TaskType.inProgress,
        label: "In progress",
        onPressed: () {
          task = TaskType.inProgress;
          onSelected(TaskType.inProgress);
        },
      ),
      _button(
        selected: task == TaskType.done,
        label: "Done",
        onPressed: () {
          task = TaskType.done;
          onSelected(TaskType.done);
        },
      ),
    ];
  }

  Widget _button({
    required bool selected,
    required String label,
    required Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color?>(colors.sorianaGreen)),
        child: Text(
          label,
        ),
      ),
    );
  }
}
