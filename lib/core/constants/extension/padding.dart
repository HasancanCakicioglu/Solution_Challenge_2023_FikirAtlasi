import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  /// Adds padding to the widget on all sides.
  ///
  /// Example:
  /// Text('Hello').paddedAll(8.0);
  Padding paddedAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  /// Adds horizontal padding to the widget.
  ///
  /// Example:
  /// Text('Hello').paddedHorizontal(16.0);
  Padding paddedHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  ///
  /// Example:
  /// Text('Hello').paddedVertical(24.0);
  Padding paddedVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  ///
  /// Example:
  /// Text('Hello').paddedSymmetric(horizontal: 8.0, vertical: 16.0);
  Padding paddedSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Adds custom padding to the widget.
  ///
  /// Example:
  /// Text('Hello').padded(EdgeInsets.only(left: 8.0, top: 16.0));
  Padding padded(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}
