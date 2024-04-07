import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/routing/app_routing.dart';

import 'drawer_btn.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          DrawerBtn(
            title: "Tasks",
            color: Colors.blue,
            icon: Icons.task,
            press: () {
              context.pushReplacementNamed(AppRouter.viewTasks);
            },
          ),
          SizedBox(height: 10),
          DrawerBtn(
            title: "Users",
            color: Colors.pink,
            icon: Icons.group,
            press: () {
              context.pushReplacementNamed(AppRouter.usersScreen);
            },
          ),
          Spacer(),
          DrawerBtn(
            title: "Logout",
            color: Colors.red,
            icon: Icons.logout,
            press: () {
              context.pushReplacementNamed(AppRouter.login);
            },
          ),
        ],
      ),
    );
  }
}
