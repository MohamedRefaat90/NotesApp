import 'package:flutter/material.dart';
import 'package:notes/core/constants/app_assets.dart';

class ImageShape extends StatelessWidget {
  const ImageShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Positioned(
      top: size.height * .42,
      left: size.width * .05,
      child: Image.asset(
        AppAssets.imageShape,
        width: 150,
      ),
    );
  }
}
