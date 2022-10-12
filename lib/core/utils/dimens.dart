import 'package:flutter/material.dart';

///
/// Esta clase retorna el valor del alto y ancho de la pantalla o un EdgeInsets respecto caclulado con un porcentaje dado y la medida en MediaQuey
///

/// Dialog sizes depending of different screen constraints

class Dimens {
  /// ancho total de la pantalla
  fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// largo total de la pantalla
  fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  fromLTRB(BuildContext context, left, top, right, bottom) {
    return EdgeInsets.fromLTRB(
      fullWidth(context) * left,
      fullWidth(context) * top,
      fullWidth(context) * right,
      fullWidth(context) * bottom,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  symetric(BuildContext context, horizontal, vertical) {
    return EdgeInsets.symmetric(
      vertical: fullWidth(context) * vertical,
      horizontal: fullWidth(context) * horizontal,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  all(BuildContext context, value) {
    return EdgeInsets.all(
      fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  horizontal(BuildContext context, value) {
    return EdgeInsets.symmetric(
      horizontal: fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  vertical(BuildContext context, value) {
    return EdgeInsets.symmetric(
      vertical: fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  top(BuildContext context, value) {
    return EdgeInsets.only(
      top: fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  left(BuildContext context, value) {
    return EdgeInsets.only(
      left: fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  right(BuildContext context, value) {
    return EdgeInsets.only(
      right: fullWidth(context) * value,
    );
  }

  /// se puede utilizar en margin o padding de un widget toma como referencia el ancho de la pantalla
  bottom(BuildContext context, value) {
    return EdgeInsets.only(
      bottom: fullWidth(context) * value,
    );
  }

  layoutPadding(BuildContext context) {
    return EdgeInsets.fromLTRB(fullWidth(context) * .05,
        fullWidth(context) * .05, fullWidth(context) * .05, 0);
  }

  cardRaduis(BuildContext context) {
    return borderRadius(15.0);
  }

  borderRadius(radius) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    );
  }

  borderRadiusContainer(radius) {
    if (radius.runtimeType == int) {
      radius = double.parse('$radius');
    }
    return BorderRadius.all(Radius.circular(radius));
  }
}

Dimens dimens = Dimens();
