import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soriana_tracker/core/utils/tools.dart';

class CustomTextInputWidget extends StatefulWidget {
  final String label;
  final Function(String) validator;
  final bool? obscureText;
  final Color? color, labelsColor;
  final TextInputAction action;
  final Widget? suffixAction;
  final double width;
  final double height;
  final String? hint;
  final String? prefixIcon;
  final double? prefixIconSize;
  final String? initialValue;
  final TextEditingController? ctrl;
  final Function(String) onChanged;

  const CustomTextInputWidget(
      {Key? key,
      required this.label,
      required this.validator,
      this.obscureText = false,
      this.suffixAction = const SizedBox(),
      this.action = TextInputAction.none,
      this.initialValue,
      required this.hint,
      required this.onChanged,
      this.color,
      this.ctrl,
      this.width = double.infinity,
      this.height = double.infinity,
      this.labelsColor,
      this.prefixIcon,
      this.prefixIconSize})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextInputWidgetState createState() => _CustomTextInputWidgetState();
}

class _CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  FocusNode focus = FocusNode();
  bool touched = false;
  bool obscureTextIcon = false;
  bool focused = false;

  Widget? _errorMessage = const SizedBox();
  bool _isInvalid = false;

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  _obscureText() {
    obscureTextIcon = !obscureTextIcon;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.label,
                style: styles.extraSmallStyle(
                  context,
                  color: _isInvalid ? colors.errorColor : widget.labelsColor,
                  bold: true,
                )),
            const Spacer(),
            widget.suffixAction!
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: _isInvalid
                    ? colors.backgroundErrorColor
                    : colors.backgroundLightColor,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.bottomCenter,
                      child: TextFormField(
                        initialValue: widget.initialValue,
                        controller: widget.ctrl,
                        style: styles.smallStyle(
                          context,
                          color: _isInvalid
                              ? colors.errorColor
                              : colors.bluePrimary,
                        ),
                        validator: (value) {
                          setState(() {
                            _errorMessage = widget.validator.call(value!);
                            _isInvalid = _errorMessage != null;
                          });

                          return _isInvalid ? '' : null;
                        },
                        focusNode: focus,
                        onChanged: (value) {
                          setState(() {
                            widget.onChanged.call(value);
                          });
                        },
                        obscureText:
                            widget.obscureText! ? !obscureTextIcon : false,
                        onTap: () {
                          setState(() {
                            touched = true;
                            focused = true;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: widget.prefixIcon != null
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 15),
                                  child: SvgPicture.asset(
                                    widget.prefixIcon!,
                                  ),
                                )
                              : null,
                          errorStyle: const TextStyle(
                              fontSize: 0.1, color: Colors.transparent),
                          contentPadding: dimens.symetric(context, .01, .014),
                          hintText: widget.hint,
                          suffixIcon: widget.obscureText!
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 15),
                                  child: widget.obscureText!
                                      ? InkWell(
                                          onTap: () => _obscureText(),
                                          child: obscureTextIcon
                                              ? SvgPicture.asset(
                                                  iconsPaths.iconHidePass,
                                                  color: colors.grayLight)
                                              : SvgPicture.asset(
                                                  iconsPaths.iconShowPass,
                                                  color: colors.grayLight))
                                      : null)
                              : null,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: colors.lightGrayColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: colors.greenSecondaryColor),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colors.errorColor),
                          ),
                          isDense: true,
                        ),
                        cursorColor: colors.primaryColor,
                      ),
                    )),
                  ],
                )),
            if (_isInvalid)
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: _errorMessage),
              )
          ],
        )
      ]),
    );
  }
}
