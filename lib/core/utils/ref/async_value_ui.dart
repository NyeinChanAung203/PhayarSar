import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(error.toString()),
        ),
      );
    }
  }
}
