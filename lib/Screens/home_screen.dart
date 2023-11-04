// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_animation/Models/tyre_psi.dart';
import 'package:tesla_car_animation/Screens/components/animated_doorlock.dart';
import 'package:tesla_car_animation/Screens/components/battery_status.dart';
import 'package:tesla_car_animation/Screens/components/bottom_nabar.dart';
import 'package:tesla_car_animation/Screens/components/temp_details.dart';
import 'package:tesla_car_animation/Screens/components/tyres.dart';
import 'package:tesla_car_animation/constants.dart';
import 'package:tesla_car_animation/home_controler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeControler _homeControler = HomeControler();

  // Battery Status Controller
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  //Tempratue Status Controller

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarshift;
  late Animation<double> _animationTempDetails;
  late Animation<double> _animationTempCoolGlow;

  // Tyre Animation
  late AnimationController _TyreAnimationController;

  late Animation<double> _animateTyrePsi1;
  late Animation<double> _animateTyrePsi2;
  late Animation<double> _animateTyrePsi3;
  late Animation<double> _animateTyrePsi4;

  late List<Animation<double>> tyReAnimations = [];

  void setTyreAnimation() {
    _TyreAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _animateTyrePsi1 = CurvedAnimation(
        parent: _TyreAnimationController, curve: const Interval(0.34, 0.5));
    _animateTyrePsi2 = CurvedAnimation(
        parent: _TyreAnimationController, curve: const Interval(0.5, 0.66));
    _animateTyrePsi3 = CurvedAnimation(
        parent: _TyreAnimationController, curve: const Interval(0.66, 0.82));
    _animateTyrePsi4 = CurvedAnimation(
        parent: _TyreAnimationController, curve: const Interval(0.82, 1));
  }

  void setTempAnima() {
    _tempAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationCarshift = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.35, 0.4));
    _animationTempDetails = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.45, 0.65));
    _animationTempCoolGlow = CurvedAnimation(
        parent: _tempAnimationController, curve: const Interval(0.7, 0.89));
  }

  void batterySetuoAnimation() {
    _batteryAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animationBattery = CurvedAnimation(
        parent: _batteryAnimationController, curve: const Interval(0.0, 0.1));
    _animationBatteryStatus = CurvedAnimation(
        parent: _batteryAnimationController, curve: const Interval(0.6, 1));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    batterySetuoAnimation();
    setTyreAnimation();
    tyReAnimations = [
      _animateTyrePsi1,
      _animateTyrePsi2,
      _animateTyrePsi3,
      _animateTyrePsi4
    ];
    setTempAnima();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _batteryAnimationController.dispose();
    _TyreAnimationController.dispose();
    _tempAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([
          _homeControler,
          _batteryAnimationController,
          _tempAnimationController
        ]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
              onpress: (index) {
                // setState(() {});
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_homeControler.slected == 1 && index != 1)
                  _batteryAnimationController.reverse(from: 0.7);
                if (index == 2)
                  _tempAnimationController.forward();
                else if (_homeControler.slected == 2 && index != 2)
                  _tempAnimationController.reverse(from: 0.3);
                if (index == 3) {
                  _TyreAnimationController.forward();
                } else if (_homeControler.slected == 3 && index != 3) {
                  _TyreAnimationController.reverse();
                }
                _homeControler.tyreController(index);
                _homeControler.showTyreStatus(index);
                _homeControler.changetab(index);
              },
              slectedTab: _homeControler.slected,
            ),
            body: SafeArea(
                child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    left: constraints.maxWidth / 2 * _animationCarshift.value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * .01),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      right: _homeControler.slected == 0
                          ? constraints.maxWidth * 0.03
                          : constraints.maxWidth * 0.5,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeControler.slected == 0 ? 1 : 0,
                        child: AnimatedLock(
                          press: () {
                            _homeControler.updateRightLock();
                          },
                          lock: _homeControler.isRightdoorLocked,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      left: _homeControler.slected == 0
                          ? constraints.maxWidth * 0.03
                          : constraints.maxWidth * 0.5,
                      child: AnimatedOpacity(
                        opacity: _homeControler.slected == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: AnimatedLock(
                          press: () {
                            _homeControler.updateLeftLock();
                          },
                          lock: _homeControler.isLefttdoorLocked,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      top: _homeControler.slected == 0
                          ? constraints.maxHeight * 0.10
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeControler.slected == 0 ? 1 : 0,
                        child: AnimatedLock(
                          press: () {
                            _homeControler.updateBonnetLock();
                          },
                          lock: _homeControler.isBonnetLocked,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _homeControler.slected == 0
                          ? constraints.maxHeight * 0.12
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeControler.slected == 0 ? 1 : 0,
                        child: AnimatedLock(
                          press: () {
                            _homeControler.updaTrunkLock();
                          },
                          lock: _homeControler.isTrunkLocked,
                        ),
                      )),
                  AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        "assets/icons/Battery.svg",
                        width: constraints.maxWidth * .45,
                      )),
                  Positioned(
                    top: 50 * (1 - _animationBatteryStatus.value),
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: constraints,
                        )),
                  ),
                  Positioned(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      top: 60 * (1 - _animationTempDetails.value),
                      child: Opacity(
                          opacity: _animationTempDetails.value,
                          child: TempDetails(homeControler: _homeControler))),
                  Positioned(
                    right: -180 * (1 - _animationTempCoolGlow.value),
                    child: AnimatedSwitcher(
                      switchInCurve: Curves.decelerate,
                      duration: defaultDuration,
                      child: _homeControler.isCoolActive
                          ? const Image(
                              width: 200,
                              image:
                                  AssetImage('assets/images/Cool_glow_2.png'))
                          : const Image(
                              width: 200,
                              image:
                                  AssetImage('assets/images/Hot_glow_4.png')),
                    ),
                  ),
                  if (_homeControler.showTyre) ...Tyres(constraints),
                  if (_homeControler.isShowTyreStatus)
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                constraints.maxWidth / constraints.maxHeight,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            crossAxisCount: 2),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ScaleTransition(
                            scale: tyReAnimations[index],
                            child: TyrePsi(
                              isBottom: index > 1,
                              text: demoPsi[index].psi.toString(),
                              temp: demoPsi[index].temp.toString(),
                              isLowPressure: demoPsi[index].isLowpressure,
                            ),
                          );
                        })
                ],
              ),
            )),
          );
        });
  }
}

class TyrePsi extends StatelessWidget {
  final String text, temp;
  final bool isBottom, isLowPressure;
  const TyrePsi({
    super.key,
    required this.isBottom,
    required this.text,
    required this.temp,
    required this.isLowPressure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: isLowPressure ? Colors.red.withOpacity(.1) : Colors.white10,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: isLowPressure ? Colors.red : primaryColor)),
      child: isBottom
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$temp\u2103',
                  style: const TextStyle(fontSize: 18),
                ),
                PsiText(
                  text: text,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PsiText(
                  text: text,
                ),
                Text(
                  '$temp\u2103',
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                isLowPressure
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Low'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Pressure'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
    );
  }
}

class PsiText extends StatelessWidget {
  final String text;
  const PsiText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: text,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        children: const [
          TextSpan(text: 'psi', style: TextStyle(fontSize: 24))
        ]));
  }
}
