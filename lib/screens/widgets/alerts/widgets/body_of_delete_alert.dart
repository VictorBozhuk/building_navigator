

import 'package:flutter/material.dart';

import '../../../../styles/alerts/size_alert.dart';
import '../../../../styles/appTheme.dart';
import '../../buttons/alert_button.dart';

class AlertDeleteBody extends StatelessWidget {
  final String title;
  final Function deleteAction;

  const AlertDeleteBody({
    Key? key,
    required this.title,
    required this.deleteAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    AlertSize alertSize = AlertSize(context);
    return IntrinsicHeight(
        child: Container(
            width: alertSize.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).colorScheme.primary
            ),
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.0127, right: screenWidth * 0.0127),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.close,
                          size: alertSize.closeIconSize, color: Colors.white,),
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: alertSize.paddingTop,
                    left: screenWidth * 0.0127,
                    right: screenWidth * 0.0127,
                    bottom: screenWidth * 0.06
                    ),
                child: Text(
                  "Are you sure to delete $title?",
                  textAlign: TextAlign.center,
                  style: AppTheme.getAlertTitleTextStyle(alertSize.textSizeTitle),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(padding: const EdgeInsets.all(10), child:
                  AlertButton(title: "Ok", onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    deleteAction();
                }),),
                Padding(padding: const EdgeInsets.all(10), child:
                  AlertButton(title: "Cancel", onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop()),),
              ],)
            ])
        ));
  }
}
