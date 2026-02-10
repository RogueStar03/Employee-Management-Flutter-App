import 'package:ams_android/bloc_architecture/base_cubit.dart';
import 'package:ams_android/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnViewModelReady<V> = void Function(V viewModel);
typedef ViewModelBuilder<V, S> = Widget Function(BuildContext context, V viewModel, S state);
typedef ViewModelOnlyBuilder<V> = Widget Function(BuildContext context, V viewModel);
typedef StateListener<S> = void Function(BuildContext context, S state);
typedef BuilderCondition<S> = bool Function(S previous, S current);
typedef OnViewModelDispose<V> = void Function(V viewModel);

class BaseView<V extends BaseCubit<S>, S> extends StatefulWidget {
  final OnViewModelReady<V>? onViewModelReady;
  final ViewModelBuilder<V, S>? builder;
  final StateListener<S>? stateListener;
  final BuilderCondition<S>? buildWhen;
  final OnViewModelDispose<V>? onViewModelDispose;

  const BaseView({
    super.key,
    this.onViewModelReady,
    this.builder,
    this.stateListener,
    this.buildWhen,
    this.onViewModelDispose,
  });

  @override
  State<BaseView<V, S>> createState() => _BaseViewState<V, S>();
}

class _BaseViewState<V extends BaseCubit<S>, S> extends State<BaseView<V, S>> {
  V viewModel = inject<V>();

  @override
  void initState() {
    super.initState();
    widget.onViewModelReady?.call(viewModel);
  }

  @override
  void dispose() {
    widget.onViewModelDispose?.call(viewModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<V>.value(
    value: viewModel,
    child: BlocConsumer<V, S>(
      builder: (context, state) =>
          widget.builder?.call(context, BlocProvider.of(context), state) ?? const SizedBox.shrink(),
      listener: widget.stateListener ?? (_, _) {},
      buildWhen: widget.buildWhen,
    ),
  );
}
