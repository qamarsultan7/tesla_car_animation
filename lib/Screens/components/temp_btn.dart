import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animation/constants.dart';

class Tempbtn extends StatelessWidget {
  final String svgSrc, title;
  final bool isActive;
  final VoidCallback onpress;
  final Color activeColor;
  const Tempbtn({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.onpress,
    required this.isActive,
    this.activeColor=primaryColor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOutBack,
              width: isActive ? 76 : 50,
              height: isActive ? 76 : 50,
              child: SvgPicture.asset(
                svgSrc,
                color: isActive ? activeColor : Colors.white38,
              )),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          AnimatedDefaultTextStyle(
            duration:const Duration(milliseconds: 200),
            style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
                color: isActive ? activeColor : Colors.white38),
            child: Text(
              title.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }
}
