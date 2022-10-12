import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soriana_tracker/core/utils/colors.dart';

class NuevaRutaView extends StatelessWidget {
  const NuevaRutaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.darkGrayColor,
      child: Center(
        child: Text('NUEVA RUTA'),
      ),
    );
  }
}
