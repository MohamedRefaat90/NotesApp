import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/login/presentation/cubit/login_cubit.dart';

import '../../../../core/widgets/custom_btn.dart';
import 'login_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.28),
          const Text(
            "Task Manager",
            style: TextStyle(
                fontSize: 40,
                color: Color(0xff4A4A4A),
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: 388,
            height: 400,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xffFFFFFF).withOpacity(0.5)),
            child: Column(
              children: [
                Text(
                  "Log in".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 30,
                      color: Color(0xff4A4A4A),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                const LoginFields(),
                const SizedBox(height: 40),
                CustomBTN(
                  press: () {
                    BlocProvider.of<LoginCubit>(context).emitLoginUser(context);
                  },
                  padding: 20,
                  width: double.infinity,
                  color: const Color(0xff7BB3FF),
                  widget: Text("Login".toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
