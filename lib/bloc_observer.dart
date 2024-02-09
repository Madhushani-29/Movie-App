import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
//we can get a log when a bloc created
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('Create: ${bloc.runtimeType} Created ! Initial State- ${bloc.state}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Change: $bloc Changed- $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $bloc Changed- $transition');
  }
}
