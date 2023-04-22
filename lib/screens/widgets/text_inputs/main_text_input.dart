import 'package:flutter/material.dart';
import 'package:lnu_navigator/screens/widgets/text_inputs/text_input.dart';

class MainTextInput extends StatelessWidget {
  const MainTextInput({
    Key? key,
    required this.inputController,
    required this.hint,
  }) : super(key: key);

  final TextEditingController inputController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: TextInput(
            inputController: inputController,
            hint: hint,)
    );
  }
}
