import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car_animation/constants.dart';

class AnimatedLock extends StatelessWidget {
  final bool lock;
  final VoidCallback press;
  const AnimatedLock({required this.lock, required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
          switchInCurve: Curves.easeInOut,
          duration: defaultDuration,
          transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
          child: lock
              ? SvgPicture.asset(
                  'assets/icons/door_lock.svg',
                  key: const ValueKey('lock'),
                )
              : SvgPicture.asset('assets/icons/door_unlock.svg',
                  key: const ValueKey('Unlock'))),
    );
  }
}
