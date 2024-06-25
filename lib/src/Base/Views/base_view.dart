import 'package:flutter/material.dart';
import 'package:espeats/src/Features/Presentation/MainCoordinator/main_coordinator.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/error_state_provider.dart';
import 'package:espeats/src/Features/Presentation/Shared/StateProviders/loading_state_provider.dart';
import 'package:espeats/src/Base/Views/loading_view.dart';

mixin BaseView {
  final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = const LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

mixin BaseViewModel{
  late LoadingStateProvider loadingState;
  void initState({ required LoadingStateProvider loadingStateProvider});
}

