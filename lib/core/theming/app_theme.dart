import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/cubit/task_view/tasks_view_cubit.dart';

class AppTheme {
  static mainTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: BlocProvider.of<TaskViewCubit>(context).themeMode,
      textTheme: TextTheme(
        bodySmall: TextStyle(fontFamily: "Almarai", color: Colors.white),
        bodyMedium: TextStyle(fontFamily: "Almarai"),
        bodyLarge: TextStyle(fontFamily: "Almarai"),
        titleMedium: TextStyle(fontFamily: "Almarai", color: Colors.white),
        titleLarge: TextStyle(fontFamily: "Almarai"),
        labelLarge: TextStyle(fontFamily: "Almarai"),
      ),
    );
  }
}
