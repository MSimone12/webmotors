import 'package:flutter/material.dart';
import 'package:webmotors/src/core/util.dart';

class AppTheme {
  static final Color _primary = fromHex('#F51344');
  static ColorScheme primary = ColorScheme.fromSeed(
    seedColor: _primary,
    background: fromHex('#F3F5F8'),
    brightness: Brightness.light,
    secondary: Colors.black,
  );
}

const title = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const subtitle = TextStyle(
  fontSize: 18,
  color: Colors.grey,
);

const hint = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);
