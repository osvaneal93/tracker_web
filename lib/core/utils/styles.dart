import 'package:flutter/material.dart';

class Styles {
  ///Font size: 72
  extraGiantStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 72,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  ///Font size: 48
  giantStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 48,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  ///Font size: 36
  extraLargeStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    semiBold = false,
    light = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 36,
      fontFamily: family,
      color: color,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  ///Font size: 24
  largeStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    height = 1,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 24,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  ///Font size: 18
  mediumStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    height = 1.5,
    bold = false,
    light = false,
    semiBold = false,
    isMobile = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 18,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  ///Font size: 16
  smallStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      fontFamily: family,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  ///Font size: 14
  extraSmallStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 14,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      letterSpacing: .05,
    );
  }

  ///Font size: 12
  tinyStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 12,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  ///Font size: 12
  extraTinyStyle(
    BuildContext context, {
    color = const Color(0xFF2B3458),
    decoration = TextDecoration.none,
    decorationColor = const Color(0xFF2B3458),
    bold = false,
    light = false,
    semiBold = false,
    family = "roboto",
  }) {
    return TextStyle(
      fontSize: 10,
      fontFamily: family,
      fontWeight: bold
          ? FontWeight.w700
          : semiBold
              ? FontWeight.w600
              : light
                  ? FontWeight.w300
                  : FontWeight.w400,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }
}

Styles styles = Styles();
