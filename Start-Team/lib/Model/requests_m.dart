import 'package:flutter/material.dart';
import 'package:st/requests.dart' as globals;

class RequestsModel {
  static List<String> itemNames = [];

  Item getById(int id) => Item(id, itemNames[id ]); //% itemNames.length]);

  Item getByPosition(int position) {
    itemNames.add('Заявка № ${position + 1}');
    globals.Glob.nupls2 = position;

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
