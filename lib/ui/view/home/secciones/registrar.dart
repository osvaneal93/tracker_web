import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/cubit/register_prov/register_prov_cubit.dart';
import 'package:soriana_tracker/ui/cubit/sidebar/sidebar_cubit.dart';
import 'package:soriana_tracker/ui/widgets/components/category_button.dart';
import 'package:soriana_tracker/ui/widgets/custom_textfield.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/custom_button.dart';

class RegistrarView extends StatelessWidget {
  const RegistrarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterProvCubit(),
      child: BlocBuilder<RegisterProvCubit, RegisterProvState>(
        builder: (context, state) {
          if (state is SavingProv) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Guardando ...',
                    style: styles.largeStyle(context,
                        color: colors.whiteColor, bold: true),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CircularProgressIndicator(
                    color: colors.sorianaGreen,
                  ),
                ],
              ),
            );
          } else if (state is SavedProv) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: colors.sorianaGreen,
                  size: 60,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Se ha guardado el Proveedor exitosamente',
                  style: styles.largeStyle(
                    context,
                    color: colors.whiteColor,
                    bold: true,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Ir al Inicio',
                      onPressed: () {
                        context.read<SidebarCubit>().changePage(0);
                      },
                    ),
                    // CustomButton(
                    //   label: 'Registrar nuevo proveedor',
                    //   onPressed: () {
                    //     context
                    //         .read<RegisterProvCubit>()
                    //         .emit(RegisterProvInitial());
                    //   },
                    // ),
                  ],
                )
              ],
            ));
          } else if (state is RegisterProvInitial) {
            return SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    _titleForm(
                        title: 'Registrar nuevo Proveedor', context: context),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildCategoryButton(context, state),
                    _buildTextformField(context),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  CategoryButton _buildCategoryButton(
      BuildContext context, RegisterProvState state) {
    return CategoryButton(
      initialSelected: state.index!,
      data: [
        CategoryButtonData(label: 'Comestibles', svgIconPath: 'groceries.svg'),
        CategoryButtonData(label: 'Papelería', svgIconPath: 'notebook.svg'),
        CategoryButtonData(label: 'Juguetes', svgIconPath: 'toys.svg'),
        CategoryButtonData(label: 'Ropa', svgIconPath: 'clothes.svg'),
        CategoryButtonData(label: 'Deportes', svgIconPath: 'sports.svg'),
        CategoryButtonData(label: 'Lacteos', svgIconPath: 'milk.svg'),
      ],
      onSelected: (int index, CategoryButtonData value) {
        context.read<RegisterProvCubit>().changeCategory(index);
      },
    );
  }

  Text _titleForm({required String title, required BuildContext context}) {
    return Text(
      title,
      style: styles.largeStyle(
        context,
        color: colors.whiteColor,
        bold: true,
      ),
    );
  }

  _buildTextformField(BuildContext context) {
    final cubit = context.read<RegisterProvCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'Nombre',
                controller: cubit.nameController,
                context: context),
            CustomTextfield(
                label: 'Apellido Paterno',
                controller: cubit.lastNameController,
                context: context),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'Apellido Materno',
                controller: cubit.secondLastNameController,
                context: context),
            CustomTextfield(
                label: 'No. IMSS',
                controller: cubit.imssNumber,
                context: context),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'RFC', controller: cubit.rfcNumber, context: context),
            CustomTextfield(
                label: 'Curp', controller: cubit.curpNumber, context: context),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'Lugar de Nacimiento',
                controller: cubit.placeOfBirth,
                context: context),
            CustomTextfield(
                label: 'Domicilio',
                controller: cubit.residence,
                context: context),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'CP', controller: cubit.cp, context: context),
            CustomTextfield(
                label: 'Puesto', controller: cubit.position, context: context),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
                label: 'Departamento',
                controller: cubit.department,
                context: context),
            CustomTextfield(
                label: 'Observaciones',
                controller: cubit.observations,
                context: context),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          label: 'Registrar Usuario',
          onPressed: () {
            cubit.cleanFields();
            cubit.registerUser();
          },
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  _showDialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
