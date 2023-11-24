import 'package:edtech_app/injection_container.dart';
import 'package:edtech_app/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    final Log log = sl<Log>();
    log.blocObserver(
      title: change.toString(),
      msg: '${change.currentState} -> ${change.nextState}',
    );
  }
}
