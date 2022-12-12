import 'package:flutter/material.dart';

InputDecoration getTextFieldDecoration(String hintText){
  return InputDecoration(
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
        hintText: hintText,
      );
}

Widget getAreaImage(String imagePath){
  try{
    return Image.network(imagePath);
  }
  catch (ex) {
    return Image.asset('assets/icons/floor_icon.png');
  }
}
