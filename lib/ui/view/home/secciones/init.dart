import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/helpers/app_helpers.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/cubit/sidebar/sidebar_cubit.dart';
import 'package:soriana_tracker/ui/widgets/components/active_project_card.dart';
import 'package:soriana_tracker/ui/widgets/components/header.dart';
import 'package:soriana_tracker/ui/widgets/components/overview_header.dart';
import 'package:soriana_tracker/ui/widgets/project_card.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/progress_card.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/progress_report_card.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/task_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class InitView extends StatelessWidget {
  const InitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        final screenSize = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: kSpacing),
              _buildHeader(),
              const SizedBox(height: kSpacing * 2),
              _buildProgress(context: context),
              const SizedBox(height: kSpacing * 2),
              _buildTaskOverview(
                data: [
                  const TaskCardData(
                      title: 'PRUEBA1',
                      dueDay: 2,
                      totalComments: 3,
                      totalContributors: 4,
                      type: TaskType.inProgress,
                      profilContributors: []),
                  const TaskCardData(
                      title: 'PRUEBA1',
                      dueDay: 2,
                      totalComments: 3,
                      totalContributors: 4,
                      type: TaskType.inProgress,
                      profilContributors: []),
                  const TaskCardData(
                      title: 'PRUEBA1',
                      dueDay: 2,
                      totalComments: 3,
                      totalContributors: 4,
                      type: TaskType.inProgress,
                      profilContributors: []),
                  const TaskCardData(
                      title: 'PRUEBA1',
                      dueDay: 2,
                      totalComments: 3,
                      totalContributors: 4,
                      type: TaskType.inProgress,
                      profilContributors: [])
                ],
                crossAxisCount: 6,
                crossAxisCellCount: (screenSize.width < 1360) ? 3 : 2,
              ),
              const SizedBox(height: kSpacing * 2),
              // _buildActiveProject(
              //   data: [],
              //   crossAxisCount: 6,
              //   crossAxisCellCount: (screenSize.width < 1360) ? 3 : 2,
              // ),
              const SizedBox(height: kSpacing),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActiveProject({
    required List<ProjectCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: ActiveProjectCard(
        onPressedSeeAll: () {},
        child: StaggeredGridView.countBuilder(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          itemCount: data.length,
          addAutomaticKeepAlives: false,
          mainAxisSpacing: kSpacing,
          crossAxisSpacing: kSpacing,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProjectCard(data: data[index]);
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(crossAxisCellCount),
        ),
      ),
    );
  }

  Widget _buildHeader({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          if (onPressedMenu != null)
            Padding(
              padding: const EdgeInsets.only(right: kSpacing),
              child: IconButton(
                onPressed: onPressedMenu,
                icon: const Icon(EvaIcons.menu),
                tooltip: "menu",
              ),
            ),
          const Expanded(child: Header()),
        ],
      ),
    );
  }

  Widget _buildProgress(
      {Axis axis = Axis.horizontal, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: (axis == Axis.horizontal)
          ? Row(
              children: [
                Flexible(
                  flex: 5,
                  child: ProgressCard(
                    data: const ProgressCardData(
                        totalInRute: 10, totalActive: 6, totalBranch: 4),
                    onPressedCheck: () {
                      context.read<SidebarCubit>().changePage(3);
                    },
                  ),
                ),
                const SizedBox(width: kSpacing / 2),
                const Flexible(
                  flex: 4,
                  child: ProgressReportCard(
                    data: ProgressReportCardData(
                      title: "Pendientes hoy",
                      doneTask: 5,
                      percent: .3,
                      task: 3,
                      undoneTask: 2,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                ProgressCard(
                  data: const ProgressCardData(
                      totalInRute: 10, totalActive: 6, totalBranch: 4),
                  onPressedCheck: () {},
                ),
                const SizedBox(height: kSpacing / 2),
                const ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 5,
                    percent: .3,
                    task: 3,
                    undoneTask: 2,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTaskOverview({
    required List<TaskCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
    Axis headerAxis = Axis.horizontal,
  }) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length + 1,
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return (index == 0)
            ? Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: OverviewHeader(
                  axis: headerAxis,
                  onSelected: (task) {},
                ),
              )
            : TaskCard(
                data: data[index - 1],
                onPressedMore: () {},
                onPressedTask: () {},
                onPressedContributors: () {},
                onPressedComments: () {},
              );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit((index == 0) ? crossAxisCount : crossAxisCellCount),
    );
  }
}
