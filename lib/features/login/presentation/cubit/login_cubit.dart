import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/features/login/data/models/user_token.dart';
import 'package:notes/features/login/data/repos/login_repo.dart';
import 'package:notes/features/login/presentation/cubit/login_state.dart';

import '../../../../core/functions/flushbar.dart';
import '../../../../core/routing/app_routing.dart';
import '../../data/models/user_input_data.dart';

class LoginCubit extends Cubit<LoginStates<userToken>> {
  final LoginRepo _loginRepo;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginCubit(this._loginRepo) : super(LoginintiState());

  void emitLoginUser(BuildContext context) async {
    var response = await _loginRepo.login(
        UserInputData(username: username.text, password: password.text)
            .toJson());

    response.when(success: (token) {
      emit(LoginStates.successState(token));
      GoRouter.of(context).pushReplacementNamed(AppRouter.viewTasks);
    }, failure: (errorMSG) {
      flushBar(context, errorMSG);
    });
  }
}
