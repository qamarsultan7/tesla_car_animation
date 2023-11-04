import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  final BoxConstraints constraints;
  const BatteryStatus({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '220 mi',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        const Text(
          '62%',
          style: TextStyle(fontSize: 24),
        ),
        const Spacer(),
        Text(
          'Charging'.toUpperCase(),
          style: const TextStyle(fontSize: 24),
        ),
        const Text(
          '18 min remaining',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.10,
        ),
        const DefaultTextStyle(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('22 mi/hr'), Text('232v')],
          ),
        )
      ],
    );
  }
}
