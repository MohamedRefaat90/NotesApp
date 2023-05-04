import 'package:flutter_bloc/flutter_bloc.dart';

class myBlocObserver extends BlocObserver{

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }
}