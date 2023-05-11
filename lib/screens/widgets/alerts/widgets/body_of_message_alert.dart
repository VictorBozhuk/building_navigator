import 'package:flutter/material.dart';

import '../../../../styles/alerts/size_alert.dart';
import '../../../../styles/appTheme.dart';

class BodyOfMessageAlert extends StatelessWidget {
  final String title;
  final Color? foregroundColor;
  final Color? background;
  const BodyOfMessageAlert({
    Key? key,
    required this.title,
    this.foregroundColor,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    AlertSize alertSize = AlertSize(context);
    return IntrinsicHeight(
        child: Container(
            width: alertSize.width,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: background ?? Theme.of(context).colorScheme.primary
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
                          size: alertSize.closeIconSize, color: foregroundColor ?? Colors.white,),
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true).pop()),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: alertSize.paddingTop,
                    left: screenWidth * 0.0127,
                    right: screenWidth * 0.0127),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTheme.getAlertTitleTextStyle(
                      color: foregroundColor ?? Colors.white,
                      alertSize.textSizeTitle),
                ),
              ),
            ])
        ));
  }
}

