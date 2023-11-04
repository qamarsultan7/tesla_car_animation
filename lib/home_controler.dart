import 'package:flutter/material.dart';

class HomeControler with ChangeNotifier {
  bool isRightdoorLocked = true;
  bool isLefttdoorLocked = true;
  bool isBonnetLocked = true;
  bool isTrunkLocked = true;
  bool isCoolActive = true;
  bool isShowTyreStatus = false;

  bool showTyre = false;

  int slected = 0;
  void changetab(int index) {
    slected = index;
    notifyListeners();
  }

  void updateRightLock() {
    isRightdoorLocked = !isRightdoorLocked;
    notifyListeners();
  }

  void updateLeftLock() {
    isLefttdoorLocked = !isLefttdoorLocked;
    notifyListeners();
  }

  void updateBonnetLock() {
    isBonnetLocked = !isBonnetLocked;
    notifyListeners();
  }

  void updaTrunkLock() {
    isTrunkLocked = !isTrunkLocked;
    notifyListeners();
  }

  void updateCool() {
    isCoolActive = !isCoolActive;
    notifyListeners();
  }

  void tyreController(int index) {
    if (slected != 3 && index == 3) {
      Future.delayed(const Duration(milliseconds: 400), () {
        showTyre = true;
        notifyListeners();
      });
    } else {
      showTyre = false;
    }

    notifyListeners();
  }

  void showTyreStatus(int index) {
    if (slected != 3 && index == 3) {
      isShowTyreStatus = true;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 600), () {
        isShowTyreStatus = false;
        notifyListeners();
      });
    }
  }
}
