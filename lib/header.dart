// This widget will draw header section of all page. Wich you will get with the project source code.

import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final Widget text;

  const HeaderWidget(this._height, this._showIcon, this.text, {Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState(_height, _showIcon, text);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  double _height;
  bool _showIcon;
  Widget text;

  _HeaderWidgetState(this._height, this._showIcon, this.text);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Stack(
      children: [

        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 400,
            width: width,
            child: text,
            color: Colors.blueAccent.shade200,
          ),
        )


      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 220);
    path.quadraticBezierTo(size.width / 4, 160, size.width / 2, 175);
    path.quadraticBezierTo(3 / 4 * size.width, 190, size.width, 140);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}