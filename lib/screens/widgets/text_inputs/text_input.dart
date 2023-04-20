import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';
import '../../functions/defaults.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.inputController,
    required this.hint,
    this.validator = defaultValidator,
  }) : super(key: key);

  final TextEditingController inputController;
  final String hint;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      cursorColor: AppTheme.foreground,
      decoration: InputDecoration(
          hoverColor: Colors.white,
          fillColor: Colors.white,
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: () => inputController.clear(),
            icon: Icon(Icons.clear, color: Theme.of(context).iconTheme.color),
            iconSize: 25,
          )
      ),
      style: Theme.of(context).textTheme.bodyMedium,);
  }
}

