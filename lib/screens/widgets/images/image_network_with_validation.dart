import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';

class ImageNetworkWithValidation extends StatelessWidget {
  final Widget errorOrEmpty;
  final String? path;
  const ImageNetworkWithValidation(this.path, {super.key, required this.errorOrEmpty});

  @override
  Widget build(BuildContext context) {
    return path == null || path!.isEmpty
      ? errorOrEmpty
      : Image.network(
          path!,
          fit: BoxFit.contain,
          errorBuilder: (BuildContext context, Object exception,
          StackTrace? stackTrace) {
            return errorOrEmpty;
          },
      );
  }
}