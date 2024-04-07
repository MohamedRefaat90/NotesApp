import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_pagination_cubit.dart';

class UsersListView extends StatefulWidget {
  final dynamic usersList;
  const UsersListView({super.key, this.usersList});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  late UserPaginationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.usersList.length,
        itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.usersList[index]['avatar'],
                      ),
                      radius: 40,
                    ),
                    SizedBox(width: 20),
                    Text(widget.usersList[index]['first_name'] +
                        " " +
                        widget.usersList[index]['last_name']),
                  ],
                ),
                // SizedBox(height: 20),
                Text(widget.usersList[index]['email'])
              ],
            )));
  }

  @override
  void initState() {
    cubit = BlocProvider.of<UserPaginationCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // attach listeners to scroll controllers
      cubit.scrollController.addListener(cubit.pagination);
    });
    super.initState();
  }
}
