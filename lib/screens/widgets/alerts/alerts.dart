import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/alerts/widgets/body_edit_and_delete_alert.dart';
import 'package:lnu_navigator/screens/widgets/alerts/widgets/body_of_delete_alert.dart';
import 'package:lnu_navigator/screens/widgets/alerts/widgets/body_of_message_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../navigation/navi.dart';
import '../../../styles/alerts/alert.dart';


void _alert({required BuildContext context, required Widget widget}){
  Alert(
    context: context,
    style: getAlertStyle(),
    closeIcon: const Icon(Icons.close, color: Colors.transparent),
    buttons: [],
    content: widget,
  ).show();
}

void alertEditAndDelete(BuildContext context, String title, {required Function onEdit, required Function onDelete}) {
  _alert(
    context: context,
    widget: AlertEditAndDeleteBody(title: title, editAction: onEdit, deleteAction: onDelete),
  );

}

void alertMessage(BuildContext context, String message) {
  _alert(
    context: context,
    widget: BodyOfMessageAlert(title: message),
  );
}

void alertDelete(BuildContext context, String title, {required Function onDelete}) {
  _alert(
    context: context,
    widget: AlertDeleteBody(title: title, deleteAction: onDelete,),
  );
}
