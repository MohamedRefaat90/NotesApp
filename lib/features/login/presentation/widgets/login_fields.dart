import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/login/presentation/cubit/login_cubit.dart';

import 'custom_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Column(
      children: [
        CustomTextField(
          textEditingController: cubit.username,
          isPass: false,
          placeholderText: "username",
        ),
        const SizedBox(height: 20),
        CustomTextField(
          textEditingController: cubit.password,
          isPass: true,
          placeholderText: "Password",
        ),
      ],
    );
  }
}
