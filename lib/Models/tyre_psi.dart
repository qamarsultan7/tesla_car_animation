class TyrePsi {
  final double psi;
  final int temp;
  final bool isLowpressure;
  TyrePsi({required this.psi, required this.temp, required this.isLowpressure});
}

final List<TyrePsi> demoPsi = [
  TyrePsi(psi: 23.6, temp: 56, isLowpressure: true),
  TyrePsi(psi: 35.5, temp: 42, isLowpressure: false),
  TyrePsi(psi: 34.6, temp: 42, isLowpressure: false),
  TyrePsi(psi: 34.8, temp: 41, isLowpressure: false),
];
