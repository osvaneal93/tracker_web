import 'package:flutter/material.dart';
import 'package:soriana_tracker/ui/widgets/shared_components/custom_dropdown.dart';

class MovimientosView extends StatelessWidget {
  const MovimientosView({super.key});

  @override
  Widget build(BuildContext context) {
    DropListModel dropListModel = DropListModel([
      OptionItem(id: "1", title: "Option 1"),
      OptionItem(id: "2", title: "Option 2")
    ]);
    OptionItem optionItemSelected =
        OptionItem(id: '1', title: "Chọn quyền truy cập");

    return Center(
      child: SelectDropList(optionItemSelected, dropListModel, (drop) {}),
    );
  }
}
