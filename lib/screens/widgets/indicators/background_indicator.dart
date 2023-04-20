import 'package:flutter/material.dart';

import '../containers/main_container.dart';
import 'indicator.dart';

class BackgroundIndicator extends StatelessWidget {
  const BackgroundIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
        child: const Center(
          child: Indicator())
    );
  }
}