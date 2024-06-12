import 'package:flutter/material.dart';
import 'package:phayarsar/core/exceptions/error_handler.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.error, this.onTryAgain, {super.key});
  final Object error;
  final VoidCallback onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ErrorHandler.getErrorMessage(error),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: onTryAgain, child: const Text('Try again'))
        ],
      ),
    );
  }
}
