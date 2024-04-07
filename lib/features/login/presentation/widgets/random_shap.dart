import 'package:flutter/material.dart';
import 'package:notes/core/constants/app_assets.dart';

class RandomShap extends StatelessWidget {
  const RandomShap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -100,
      left: -70,
      child: Image.asset(
        AppAssets.randomShape,
        width: 350,
      ),
    );
  }
}
