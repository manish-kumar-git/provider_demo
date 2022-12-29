import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void setCount() {
    _counter++;
    notifyListeners();
  }
}

class SliderProvider with ChangeNotifier {
  double _sliderVal = 1;
  double get value => _sliderVal;

  void change(var val) {
    _sliderVal = val;
    notifyListeners();
  }
}

class FavouriteProvider with ChangeNotifier {
  List<int> selected = [];
  List<int> get favItem => selected;

  addSelected(var index) {
    selected.add(index);
    notifyListeners();
  }

  removeItem(var index) {
    selected.remove(index);
    notifyListeners();
  }
}

class DarkThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get theme => _themeMode;

  bool isDark = false;
  bool get soop => isDark;

  changeTheme(var val) {
    if (val == false) {
      isDark = false;
      _themeMode = ThemeMode.light;
    } else {
      isDark = true;
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
