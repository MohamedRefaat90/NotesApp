import 'package:flutter/material.dart';
import 'package:notes/core/constants/app_assets.dart';

class CameraShape extends StatelessWidget {
  const CameraShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Positioned(
      top: size.height * -.06,
      left: -40,
      child: Image.asset(
        AppAssets.camera,
        width: 350,
      ),
    );
  }
}
