import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:espeats/src/Base/ApiService/app_error.dart';
import 'package:espeats/src/Features/Presentation/Shared/Components/Alerts/ErrorAlertView/error_alert_view.dart';

abstract class ErrorStateProviderDelegate {
  void setFailure({required BuildContext context, required Failure value});
}

class ErrorStateProvider extends ChangeNotifier implements ErrorStateProviderDelegate{
  late Failure _failure;

  @override
  void setFailure({ required BuildContext context, required Failure value }) {
    _failure = value;
    showErrorAlert(context: context, message: _failure.toString());
    notifyListeners();
  }

  showErrorAlert({ required BuildContext context, required String message }) {
    ErrorAlertView.showErrorAlertDialog(
        context: context,
        subTitle: message,
        ctaButtonAction: () {
          Navigator.pop(context);
    });
  }

}

/*
extension ErrorStateProviderExtension on BuildContext {
  showErrorAlert({ required BuildContext context, required String message }) => Provider.of<ErrorStateProvider>(this, listen: false).showErrorAlert(context: context, message: message);
}*/