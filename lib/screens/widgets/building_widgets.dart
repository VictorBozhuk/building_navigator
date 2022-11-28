import 'package:flutter/material.dart';


class ProfileItemButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function func;
  const ProfileItemButton(
      {Key? key,
        required this.title,
        required this.icon,
        required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _contentWidth = MediaQuery.of(context).size.width - 40;
    return Container(
      margin: const EdgeInsets.only(top:5, bottom: 5),
      width: _contentWidth,
      child: ElevatedButton(
        onPressed: () => func(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ Text(title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            height: 1)),
                    icon,
              ],
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shadowColor: Colors.transparent,
          fixedSize: const Size.fromHeight(48),
          primary: Colors.indigo.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

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
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              func();
            },
            child: Icon(
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
            child: Icon(
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
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
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
