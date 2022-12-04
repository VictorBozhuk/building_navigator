import 'package:flutter/material.dart';



AppBar getAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600)),
  );
}

AppBar getAdminAppBar(String title, Function func) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600)),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              func();
            },
            child: const Icon(
              Icons.add,
              size: 35.0,
            ),
          )
      ),
    ],

  );
}

AppBar getAdminAppBarEdit(String title, Function func) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600)),
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              func();
            },
            child: const Icon(
              Icons.edit,
              size: 35.0,
            ),
          )
      ),
    ],

  );
}

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
