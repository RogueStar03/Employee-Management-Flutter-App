import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.state);

  /// Emit a new state. Enables writing `state = newState;`
  set state(S value) => emit(value);

  /// Emits the current state again. For force-refreshing UI
  void updateState() => emit(state);

  @override
  void onChange(Change<S> change) {
    super.onChange(change);
  }
}
