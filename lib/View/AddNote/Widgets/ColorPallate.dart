import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/View/AddNote/AddNote_cubit/add_note_cubit.dart';

import '../../../constants.dart';

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
    int selectedColor = BlocProvider.of<AddNoteCubit>(context).selectedColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          itemCount: noteColors.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              selectedColor = index;
              BlocProvider.of<AddNoteCubit>(context).selectedColor = index;
              setState(() {});
            },
            child: 
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(noteColors[index]),
                        border: selectedColor == index? Border.all(color: Colors.white, width: 4) : const Border()),
                  )

          ),
        ),
      ),
    );
  }
}
