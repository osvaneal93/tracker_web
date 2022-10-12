import 'package:flutter/material.dart';
import 'package:soriana_tracker/core/utils/colors.dart';

class DropListModel {
  DropListModel(this.listOptionItems);

  final List<OptionItem> listOptionItems;
}

class OptionItem {
  final String id;
  final String title;

  OptionItem({required this.id, required this.title});
}

class SelectDropList extends StatefulWidget {
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final Function(OptionItem optionItem) onOptionSelected;

  const SelectDropList(
      this.itemSelected, this.dropListModel, this.onOptionSelected,
      {super.key});

  @override
  _SelectDropListState createState() => _SelectDropListState(
      optionItemSelected: itemSelected, dropListModel: dropListModel);
}

class _SelectDropListState extends State<SelectDropList>
    with SingleTickerProviderStateMixin {
  OptionItem? optionItemSelected;
  final DropListModel? dropListModel;

  AnimationController? expandController;
  Animation<double>? animation;
  GlobalKey? actionKey = LabeledGlobalKey('keyed');
  double? width;
  double? height;
  double? xP;
  double? yP;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;

  bool isShow = false;

  _SelectDropListState(
      {required this.optionItemSelected, required this.dropListModel});

  @override
  void initState() {
    super.initState();
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            key: actionKey,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))
              ],
            ),
            child: InkWell(
              onTap: () {
                isShow = !isShow;
                // _runExpandCheck();
                setState(() {
                  if (isDropdownOpened) {
                    floatingDropdown!.remove();
                  } else {
                    findDropdownData();
                    floatingDropdown = _createFloatingDropdown();
                    Overlay.of(context)?.insert(floatingDropdown!);
                  }
                  isDropdownOpened = !isDropdownOpened;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.card_travel,
                    color: Color(0xFF307DF1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      optionItemSelected!.title,
                      style: const TextStyle(
                          color: Color(0xFF307DF1), fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1, 0),
                    child: Icon(
                      isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                      color: const Color(0xFF307DF1),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),

//          Divider(color: Colors.grey.shade300, height: 1,)
          )
        ],
      ),
    );
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey!.currentContext?.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xP = offset.dx;
    yP = offset.dy;

    print('HEIGHT $height');
    print('WIDTH $width');
    print('X POS $xP');
    print('Y POS $yP');
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: yP! + height!,
        left: xP,
        child: SizedBox(
          height: 300,
          width: width,
          child: SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: animation!,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.black26,
                      offset: Offset(0, 4))
                ],
              ),
              child: _buildDropListOptions(
                  dropListModel!.listOptionItems, context),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                ),
                child: Text(item.title,
                    style: const TextStyle(
                        color: Color(0xFF307DF1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          optionItemSelected = item;
          isShow = false;
          expandController!.reverse();
          widget.onOptionSelected(item);
        },
      ),
    );
  }
}
