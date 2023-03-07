import 'dart:developer';

import 'package:flutter/material.dart';

class CollapsibleController extends ChangeNotifier {
  CollapsibleController({
    bool? isCollapsed,
  }) : isCollapsed = isCollapsed ?? false;
  bool isCollapsed;

  void collapse() {
    isCollapsed = true;
    notifyListeners();
  }

  void expand() {
    isCollapsed = false;
    notifyListeners();
  }

  void toggle() {
    isCollapsed = !isCollapsed;
    log('toggle isCollapsed to $isCollapsed');
    notifyListeners();
  }

 
}
