import 'package:flutter/material.dart';

class CustomScrollController extends ScrollController {
  CustomScrollController() : super();

  double get previousScrollOffset => _previousScrollOffset.first;
  final List<double> _previousScrollOffset = [0.0];

  set previousScrollOffset(double value) {
    if (_previousScrollOffset.length > 1) {
      _previousScrollOffset.removeAt(0);
    }
    _previousScrollOffset.add(value);
  }

  double distanceOfScroll() {
    return position.pixels - previousScrollOffset;
  }

  bool isMaxExtent() {
    return position.pixels >= position.maxScrollExtent;
  }

  bool isMinExtent() {
    return position.pixels <= position.minScrollExtent;
  }

  /// New function to animate based on position
  void animateToClosestState() {
    final double threshold = position.maxScrollExtent / 2; // Adjust as needed
    if (position.pixels > threshold) {
      animateTo(position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    } else {
      animateTo(0.0,
          duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
    }
  }

  @override
  void notifyListeners() {
    previousScrollOffset = position.pixels;
    super.notifyListeners();
  }
}
