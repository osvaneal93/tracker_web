import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/utils/tools.dart';
import 'package:soriana_tracker/ui/cubit/sidebar/sidebar_cubit.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({
    this.initialSelected = 0,
    required this.data,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  List<Widget> itemList(BuildContext context) {
    final cubit = context.read<SidebarCubit>();
    List<Widget> itemsList = data.asMap().entries.map((e) {
      final index = e.key;
      final data = e.value;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _Button(
          selected: cubit.state.index == index,
          onPressed: () {
            cubit.changePage(index);
          },
          data: data,
        ),
      );
    }).toList();

    return itemsList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: itemList(context));
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.selected,
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (!selected)
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).errorColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Row(
            children: [
              _icon((!selected) ? data.icon : data.activeIcon, context),
              const SizedBox(width: kSpacing / 2),
              Expanded(child: _labelText(data.label)),
              if (data.totalNotif != null)
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing / 2),
                  child: _notif(data.totalNotif!),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon(IconData iconData, BuildContext context) {
    return Icon(iconData,
        size: 20,
        color: (!selected)
            ? kFontColorPallets[1]
            : Theme.of(context).colorScheme.onPrimary);
  }

  Widget _labelText(String data) {
    return Text(
      data,
      style: TextStyle(
        color: (!selected) ? kFontColorPallets[1] : colors.greenPrimary,
        fontWeight: FontWeight.w600,
        letterSpacing: .8,
        fontSize: 13,
      ),
    );
  }

  Widget _notif(int total) {
    return (total <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: kNotifColor,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              (total >= 100) ? "99+" : "$total",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
