import 'package:flutter/material.dart';

class Responsivo extends StatelessWidget {
  const Responsivo({ Key? key }) : super(key: key);

  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width >= 800 &&
    MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}