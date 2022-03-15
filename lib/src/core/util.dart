import 'package:flutter/material.dart';

Color fromHex(String hex) {
  final customColor = hex
      .toLowerCase()
      .replaceAll('0x', '')
      .replaceAll('#', '')
      .padLeft(8, 'f');
  return Color(int.parse(customColor, radix: 16));
}

String maskBalance(int? balance) {
  balance = balance ?? 0;
  bool isNegative = balance < 0;
  if (isNegative) balance = balance * -1;
  String maskedBalance = (balance / 100)
      .toStringAsFixed(2)
      .split('.')
      .map((e) => e.split(RegExp(r'(?=(?:...)*$)')).join('.'))
      .join(',');
  return '${isNegative ? '-' : ''}$maskedBalance';
}
