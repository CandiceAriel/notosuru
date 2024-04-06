import 'package:bloc/bloc.dart';


class NotesObserver extends BlocObserver {
  const NotesObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}