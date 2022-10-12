import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/bloc/app/app_bloc.dart';
import 'package:soriana_tracker/ui/widgets/project_card.dart';
import 'package:soriana_tracker/ui/widgets/selection_button.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/custom_button.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    required this.data,
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final ProjectCardData data;
  final Function(int, SelectionButtonData) onSelected;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 1.1,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(kSpacing),
            child: ProjectCard(
              data: data,
            ),
          ),
          const Divider(thickness: 1),
          SelectionButton(data: [
            SelectionButtonData(
              activeIcon: EvaIcons.grid,
              icon: EvaIcons.gridOutline,
              label: "Inicio",
            ),
            SelectionButtonData(
              activeIcon: EvaIcons.archive,
              icon: EvaIcons.archiveOutline,
              label: "Registrar",
            ),
            SelectionButtonData(
              activeIcon: EvaIcons.calendar,
              icon: EvaIcons.calendarOutline,
              label: "Consultas",
            ),
            SelectionButtonData(
              activeIcon: EvaIcons.search,
              icon: EvaIcons.searchOutline,
              label: "Movimientos",
            ),
            SelectionButtonData(
              activeIcon: EvaIcons.award,
              icon: EvaIcons.awardOutline,
              label: "Nueva ruta",
            ),
          ], onSelected: onSelected),

          const Divider(thickness: 1),

          const SizedBox(height: kSpacing * 2),
          CustomButton(
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              label: 'Cerrar Sesión'),
          const SizedBox(height: kSpacing * 2),

          // UpgradePremiumCard(
          //   backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
