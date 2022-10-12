import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soriana_tracker/core/utils/responsive_builder.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/domain/repository/auth_repository.dart';
import 'package:soriana_tracker/ui/cubit/login/login_cubit.dart';
import 'package:soriana_tracker/ui/widgets/custom_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static Page page() => const MaterialPage<void>(child: LoginView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthRepository>()),
        child: ResponsiveBuilder(
          mobileBuilder: (context, constraints) {
            return SizedBox(
              child: Stack(
                children: [
                  _buildBackground(context, constraints),
                  _buildFormfieldBackground(context, constraints),
                ],
              ),
            );
          },
          tabletBuilder: (context, constraints) {
            return SizedBox(
              child: Stack(
                children: [
                  _buildBackground(context, constraints),
                  _buildFormfieldBackground(context, constraints),
                ],
              ),
            );
          },
          desktopBuilder: (context, constraints) {
            return SizedBox(
              child: Stack(
                children: [
                  _buildBackground(context, constraints),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      _buildContextTitle(context),
                      const Spacer(),
                      _buildFormfieldBackground(context, constraints),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context, BoxConstraints constraints) {
    return (!ResponsiveBuilder.isMobile(context))
        ? Row(
            children: [
              Container(
                color: colors.greenPrimary,
                width: constraints.maxWidth * .80,
                height: constraints.maxHeight,
              ),
              Container(
                color: colors.whiteColor,
                width: constraints.maxWidth * .2,
                height: constraints.maxHeight,
              )
            ],
          )
        : Column(
            children: [
              Container(
                color: colors.greenPrimary,
                width: constraints.maxWidth,
                height: constraints.maxHeight * .5,
              ),
              Container(
                color: colors.orangePrimary,
                width: constraints.maxWidth,
                height: constraints.maxHeight * .5,
              )
            ],
          );
  }

  Widget _buildFormfieldBackground(
      BuildContext context, BoxConstraints constraints) {
    return (!ResponsiveBuilder.isMobile(context))
        ? Container(
            padding: const EdgeInsets.all(50),
            height: constraints.maxHeight * .85,
            width: constraints.maxWidth * .45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors.orangePrimary.withOpacity(.9)),
            child: CustomForm(constraints: constraints),
          )
        : Container(
            height: constraints.maxHeight * .6,
            width: constraints.maxWidth * .7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colors.whiteColor.withOpacity(.9)),
          );
  }

  Widget _buildContextTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'logo_soriana.png',
          height: 150,
          width: 150,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Text(
            'CONTROL TRACKER SORIANA',
            style: styles.giantStyle(context,
                color: colors.whiteColor, bold: true),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'stand.svg',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              width: 50,
            ),
            SvgPicture.asset(
              'very_good.svg',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ],
    );
  }
}
