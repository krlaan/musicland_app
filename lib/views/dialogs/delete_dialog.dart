import 'package:flutter/material.dart';
import 'package:musicland_app/views/constants/strings.dart';
import 'package:musicland_app/views/dialogs/alert_dialog_model.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
    title: '${Strings.delete} $titleOfObjectToDelete?',
    message:
    '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?',
    buttons: const {
      Strings.cancel: false,
      Strings.delete: true,
    },
  );
}
