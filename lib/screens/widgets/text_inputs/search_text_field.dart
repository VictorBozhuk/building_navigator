import 'package:flutter/material.dart';

import '../../../styles/appTheme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
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
        child: TextField(
        controller: inputController,
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
            prefixIcon: const Icon(Icons.search, size: 25, color: AppTheme.iconColorDark),
            suffixIcon: IconButton(
              onPressed: () => inputController.clear(),
              icon: Icon(Icons.clear, color: Theme.of(context).iconTheme.color),
              iconSize: 25,
            )
        ),
        style: Theme.of(context).textTheme.bodyMedium,)
    );
  }
}
