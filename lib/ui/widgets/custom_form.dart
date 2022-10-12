import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/cubit/login/login_cubit.dart';
import 'package:soriana_tracker/ui/widgets/custom_textfield.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) => Form(
          key: cubit.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Iniciar Sesión',
                style:
                    styles.extraLargeStyle(context, color: colors.whiteColor),
              ),
              SizedBox(
                height: constraints.maxHeight * .03,
              ),
              CustomTextfield(
                label: 'Email: ',
                context: context,
                controller: cubit.loginEmailController,
                validator: (email) =>
                    validators.validateEmail(email: email!, context: context),
              ),
              CustomTextfield(
                label: 'Password: ',
                context: context,
                obscureText: true,
                validator: (password) =>
                    validators.validatePassword(password: password!),
                controller: cubit.loginPasswordController,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Text(
                          "Recordarme",
                          style: styles.smallStyle(context,
                              color: colors.whiteColor),
                        ),
                      ),
                      value: true,
                      activeColor: colors.whiteColor,
                      checkColor: colors.orangePrimary,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),
                  Column(
                    children: [
                      Text('No tienes cuenta? Click aquí',
                          style: styles.smallStyle(context,
                              color: colors.greenPrimary)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * .03,
              ),
              Center(
                child: state.status == LoginStatus.submitting
                    ? const CircularProgressIndicator()
                    : MaterialButton(
                        height: 50,
                        minWidth: 180,
                        onPressed: () {
                          if (cubit.loginFormKey.currentState!.validate()) {
                            context.read<LoginCubit>().logInWithCredentials();
                          }
                        },
                        color: colors.greenPrimary,
                        child: Text(
                          'Ingresar',
                          style: styles.mediumStyle(context,
                              color: colors.whiteColor),
                        ),
                      ),
              ),
              state.status == LoginStatus.error
                  ? Center(
                      child: Text(
                        state.errorMessage!,
                        style: styles.mediumStyle(context,
                            color: colors.whiteColor),
                      ),
                    )
                  : Container()
            ],
          )),
    );
  }
}
