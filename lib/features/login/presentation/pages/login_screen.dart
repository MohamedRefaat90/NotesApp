import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../cubit/login_cubit.dart';
import '../widgets/camera_shape.dart';
import '../widgets/circles.dart';
import '../widgets/image_shape.dart';
import '../widgets/login_form.dart';
import '../widgets/pink_bubble.dart';
import '../widgets/purble_bubble.dart';
import '../widgets/random_shap.dart';
import '../widgets/video_shape.dart';
import '../widgets/pink_bubble copy.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(getIt()),
          child: const SafeArea(
              child: Stack(children: [
            OrangeBubble(
              yOffest: 200,
              xOffest: 100,
              color: Color(0xffFFDADA),
            ),
            PurbleBubble(
              yOffest: -100,
              xOffest: -100,
              color: Color(0xffDDCDFF),
            ),
            PinkBubble(
              yOffest: 180,
              xOffest: 300,
              color: Color(0xffEA94D7),
            ),

            RandomShap(),
            CameraShape(),
            CirclesShape(),
            VideoShape(),
            ImageShape(),

            LoginForm()

            // ),
          ])),
        ),
      ),
    );
  }
}
