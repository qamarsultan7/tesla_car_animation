import 'package:flutter/material.dart';
import 'package:tesla_car_animation/Screens/components/temp_btn.dart';
import 'package:tesla_car_animation/constants.dart';
import 'package:tesla_car_animation/home_controler.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeControler homeControler,
  }) : _homeControler = homeControler;

  final HomeControler _homeControler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Tempbtn(
                  svgSrc: 'assets/icons/coolShape.svg',
                  onpress: () {
                    _homeControler.updateCool();
                  },
                  isActive: _homeControler.isCoolActive,
                  title: 'Cool',
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                Tempbtn(
                  activeColor: Colors.red,
                  svgSrc: 'assets/icons/heatShape.svg',
                  onpress: () {
                    _homeControler.updateCool();
                  },
                  isActive: !_homeControler.isCoolActive,
                  title: 'Heat',
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_up,
                    size: 48,
                  )),
              const Text(
                '29' '\u2103',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 86),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_drop_up,
                    size: 48,
                  )),
            ],
          ),
          const Spacer(),
          const Text('Current Temperature'),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Inside '.toUpperCase()),
                  Text(
                    '20\u2103',
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Outside '.toUpperCase(),
                    style: const TextStyle(color: Colors.white54),
                  ),
                  Text(
                    '35\u2103',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white54),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
