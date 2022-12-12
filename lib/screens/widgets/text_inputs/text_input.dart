import 'package:flutter/material.dart';

import '../../../Style/text_styles/text_styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.inputController,
    required this.hint,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController inputController;
  final String hint;
  final String label;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: inputController,
        decoration: InputDecoration(
            hoverColor: Colors.white,
            fillColor: Colors.white,
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            hintText: hint,
            suffixIcon: IconButton(
              onPressed: () => inputController.clear(),
              icon: const Icon(Icons.clear, color: Colors.white,),
              iconSize: 40,
            )
        ),
        style: textStyleMainNormalText,
        onChanged: onChanged);
  }
}
