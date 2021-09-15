import 'package:flutter/material.dart';
import 'package:flutter_diablo2_exchange/index.dart';

class LadderScreen extends StatelessWidget {
  const LadderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/body_background.jpg'),
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
