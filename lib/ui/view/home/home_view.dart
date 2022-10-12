import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/responsive_builder.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/domain/repository/home_repository/sidebar_repository.dart';
import 'package:soriana_tracker/ui/bloc/app/app_bloc.dart';
import 'package:soriana_tracker/ui/cubit/page_view/page_view_cubit.dart';
import 'package:soriana_tracker/ui/cubit/sidebar/sidebar_cubit.dart';
import 'package:soriana_tracker/ui/widgets/components/secciones.dart';
import 'package:soriana_tracker/ui/widgets/components/sidebar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/ui/widgets/project_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static Page page() => const MaterialPage<void>(child: HomeView());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ResponsiveBuilder(
        desktopBuilder: (BuildContext context, BoxConstraints constraints) =>
            RepositoryProvider(
          create: (context) =>
              SidebarRepository(context.read<AppBloc>().state.user.id),
          child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      SidebarCubit(context.read<SidebarRepository>())
                        ..getSucursales(),
                ),
                BlocProvider(
                  create: (context) =>
                      PageViewCubit(context.read<SidebarCubit>()),
                ),
              ],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: (constraints.maxWidth < 1360) ? 4 : 3,
                    child: BlocBuilder<SidebarCubit, SidebarState>(
                      builder: (context, state) {
                        if (state is SidebarLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SidebarLoaded) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Column(
                                  children: [
                                    Sidebar(
                                      //Utilizar los datos de el usuario guardados por el provider

                                      data: ProjectCardData(
                                          projectImage: const NetworkImage(''),
                                          projectName:
                                              state.sucursalModel!.nombre!,
                                          releaseTime: DateTime.now(),
                                          percent: 85),
                                      onSelected: (p0, p1) {
                                        context
                                            .read<SidebarCubit>()
                                            .changePage(p0);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  BlocBuilder<PageViewCubit, PageViewState>(
                    builder: (context, state) {
                      return Flexible(
                          flex: 9,
                          child: PageView(
                            controller:
                                context.read<PageViewCubit>().pageController,
                            children: secciones,
                          ));
                    },
                  ),

                  // Flexible(
                  //   flex: 9,
                  //   child: Column(
                  //     children: [
                  //       const SizedBox(height: kSpacing),
                  //       _buildHeader(),
                  //       const SizedBox(height: kSpacing * 2),
                  //       _buildProgress(),
                  //       const SizedBox(height: kSpacing * 2),
                  //       _buildTaskOverview(
                  //         data: controller.getAllTask(),
                  //         crossAxisCount: 6,
                  //         crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
                  //       ),
                  //       const SizedBox(height: kSpacing * 2),
                  //       _buildActiveProject(
                  //         data: controller.getActiveProject(),
                  //         crossAxisCount: 6,
                  //         crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
                  //       ),
                  //       const SizedBox(height: kSpacing),
                  //     ],
                  //   ),
                  // ),
                  // Flexible(
                  //   flex: 4,
                  //   child: Column(
                  //     children: [
                  //       const SizedBox(height: kSpacing / 2),
                  //       _buildProfile(data: controller.getProfil()),
                  //       const Divider(thickness: 1),
                  //       const SizedBox(height: kSpacing),
                  //       _buildTeamMember(data: controller.getMember()),
                  //       const SizedBox(height: kSpacing),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                  //         child: GetPremiumCard(onPressed: () {}),
                  //       ),
                  //       const SizedBox(height: kSpacing),
                  //       const Divider(thickness: 1),
                  //       const SizedBox(height: kSpacing),
                  //       _buildRecentMessages(data: controller.getChatting()),
                  //     ],
                  //   ),
                  // )
                ],
              )),
        ),
        mobileBuilder: (BuildContext context, BoxConstraints constraints) =>
            Container(),
        tabletBuilder: (BuildContext context, BoxConstraints constraints) =>
            Container(),
      ),
    );
  }
}
