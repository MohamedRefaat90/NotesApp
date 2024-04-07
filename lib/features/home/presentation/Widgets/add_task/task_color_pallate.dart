import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/home/presentation/cubit/add_task/add_task_cubit.dart';

import '../../../../../core/helpers/constants.dart';

class ColorPallate extends StatefulWidget {
  const ColorPallate({
    super.key,
  });

  @override
  State<ColorPallate> createState() => _ColorPallateState();
}

class _ColorPallateState extends State<ColorPallate> {
  @override
  Widget build(BuildContext context) {
    int selectedColor = BlocProvider.of<AddTaskCubit>(context).selectedColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          itemCount: kTaskColors.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                selectedColor = index;
                BlocProvider.of<AddTaskCubit>(context).selectedColor = index;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(kTaskColors[index]),
                    border: selectedColor == index
                        ? Border.all(color: Colors.white, width: 4)
                        : const Border()),
              )),
        ),
      ),
    );
  }
}
