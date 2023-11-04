 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 
  List<Widget> Tyres(BoxConstraints constraints) {
    return [
                  Positioned(
                      top: constraints.maxHeight * .17,
                      left: constraints.maxWidth * 0.2,
                      child: SvgPicture.asset('assets/icons/FL_Tyre.svg')),
                  Positioned(
                      top: constraints.maxHeight * .17,
                      right: constraints.maxWidth * 0.2,
                      child: SvgPicture.asset('assets/icons/FL_Tyre.svg')),
                  Positioned(
                      top: constraints.maxHeight * .65,
                      left: constraints.maxWidth * 0.2,
                      child: SvgPicture.asset('assets/icons/FL_Tyre.svg')),
                  Positioned(
                      top: constraints.maxHeight * .65,
                      right: constraints.maxWidth * 0.2,
                      child: SvgPicture.asset('assets/icons/FL_Tyre.svg'))
                ];
  }

