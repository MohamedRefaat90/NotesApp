import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/di/di.dart';
import 'package:notes/features/users_paginations/presentation/cubit/user_pagination_state.dart';

import '../../../../core/widgets/error_msg_widget.dart';
import '../../../../core/widgets/loader.dart';
import '../../../home/presentation/Widgets/tasks_view/drawer.dart';
import '../cubit/user_pagination_cubit.dart';
import '../widgets/UsersListView.dart';
import '../widgets/loading_more_users.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserPaginationCubit>(
      create: (context) => UserPaginationCubit(getIt())..emitUsers(),
      child: Scaffold(
        appBar: AppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<UserPaginationCubit, UserPaginationState>(
          builder: (context, state) {
            UserPaginationCubit cubit =
                BlocProvider.of<UserPaginationCubit>(context);
            return SingleChildScrollView(
              controller: cubit.scrollController,
              child: state.when(
                  initial: () => loader(),
                  success: (users) => UsersListView(usersList: users),
                  pagination: () => LoadingMoreUsers(),
                  failure: (errorMsg) => ErrorMsgWidget(errorMsg: errorMsg)),
            );
          },
        ),
      ),
    );
  }
}
