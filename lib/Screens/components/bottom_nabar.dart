// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_animation/constants.dart';

class TeslaBottomNavigationBar extends StatelessWidget {
  final int slectedTab;
  final ValueChanged<int> onpress;
  const TeslaBottomNavigationBar({
    super.key,required this.slectedTab, required this.onpress,
    
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onpress,
      type: BottomNavigationBarType.fixed,
      
      backgroundColor: Colors.black,
        items: List.generate(navIconSrc.length, (index) {
          return
      BottomNavigationBarItem(
          label: '', icon: SvgPicture.asset(navIconSrc[index],color: slectedTab==index?primaryColor:Colors.white54,));
    }));
  }
}

List<String> navIconSrc = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg'
];