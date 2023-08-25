import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:san3a/layout/san3a_layout.dart';
import 'package:san3a/layout/filter_screen.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController=ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: Filter_screen(),
      mainScreen: San3aLayout(),
     menuBackgroundColor: Colors.blue,
     // clipMainScreen: true,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
    borderRadius: 30,
      angle: 0.0,

    );
  }
}
