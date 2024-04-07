import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_pagination_cubit.dart';
import 'UsersListView.dart';

class LoadingMoreUsers extends StatelessWidget {
  const LoadingMoreUsers({super.key});

  @override
  Widget build(BuildContext context) {
    UserPaginationCubit cubit = BlocProvider.of<UserPaginationCubit>(context);
    return Column(
      children: [
        UsersListView(usersList: cubit.usersList),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    );
  }
}
