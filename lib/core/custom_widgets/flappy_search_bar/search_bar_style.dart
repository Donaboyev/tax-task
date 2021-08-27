import 'package:flutter/material.dart';

class SearchBarStyle {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  const SearchBarStyle({
    this.backgroundColor = const Color(0xffF9F9FD),
    this.padding = const EdgeInsets.all(16),
    this.borderRadius: const BorderRadius.all(Radius.circular(12.0)),
  });
}
