import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/cubit/register_prov/register_prov_cubit.dart';

class CategoryButtonData {
  final String label;
  final String svgIconPath;

  CategoryButtonData({required this.svgIconPath, required this.label});
}

class CategoryButton extends StatelessWidget {
  final int initialSelected;
  final List<CategoryButtonData> data;
  final Function(int index, CategoryButtonData value) onSelected;
  const CategoryButton(
      {super.key,
      required this.initialSelected,
      required this.data,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _categoryItemList(context, onSelected),
      ),
    );
  }

  List<Widget> _categoryItemList(BuildContext context,
      Function(int index, CategoryButtonData value) onTap) {
    final cubit = context.read<RegisterProvCubit>();

    List<Widget> categoryItemList = data.asMap().entries.map((e) {
      final index = e.key;
      final data = e.value;
      return _CircleIconCategory(
        title: data.label,
        svgIconPath: data.svgIconPath,
        selected: cubit.state.index == index,
        onTap: () {
          cubit.changeCategory(index);
        },
      );
    }).toList();

    return categoryItemList;
  }
}

class _CircleIconCategory extends StatelessWidget {
  const _CircleIconCategory({
    Key? key,
    required this.title,
    required this.svgIconPath,
    required this.selected,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String svgIconPath;
  final bool selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        highlightColor: colors.transparentColor,
        splashColor: colors.transparentColor,
        focusColor: colors.transparentColor,
        hoverColor: colors.transparentColor,
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: selected
                  ? colors.greenPrimary
                  : colors.greenPrimary.withOpacity(.7),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: selected
                    ? colors.sorianaGreen
                    : colors.sorianaGreen.withOpacity(.7),
                child: SvgPicture.asset(
                  svgIconPath,
                  height: 30,
                  color: selected
                      ? colors.greenPrimary
                      : colors.greenPrimary.withOpacity(.7),
                ),
              ),
            ),
            Text(
              title,
              style: styles.smallStyle(context, color: colors.greenPrimary),
            )
          ],
        ),
      ),
    );
  }
}
