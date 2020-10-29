import 'package:flutter/material.dart';

class HistoryModel {
  static List<String> itemNames = [
    'Anno Domini',
    'Postscriptum',
    '1972',
    'August',
    'Ah, smile',
    'Butterfly',
    'For poems',
    'Hydra',
    'Love',
    'Debut',
    'Loneliness',
    'Still life',
    'Pilgrims',
    'Candlestick',
    'Six years later',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;

  Item(this.id, this.name);

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
