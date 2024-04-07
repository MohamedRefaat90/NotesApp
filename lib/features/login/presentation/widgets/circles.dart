import 'package:flutter/widgets.dart';
import 'package:notes/core/constants/app_assets.dart';

class CirclesShape extends StatelessWidget {
  const CirclesShape({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Positioned(
      top: size.height * .42,
      left: size.width * .5,
      child: Image.asset(
        AppAssets.circles,
        width: 200,
      ),
    );
  }
}
