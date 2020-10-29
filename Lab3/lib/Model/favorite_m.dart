import 'package:flutter/foundation.dart';
import 'package:poetry/Model/history_m.dart';

class FavoriteModel extends ChangeNotifier {
  HistoryModel _history;

  final List<int> _itemIds = [];

  HistoryModel get history => _history;

  set history(HistoryModel newHistory) {
    assert(newHistory != null);
    assert(_itemIds.every((id) => newHistory.getById(id) != null),
        'The history $newHistory does not have one of $_itemIds in it.');
    _history = newHistory;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _history.getById(id)).toList();

  int get totalScore => items.fold(0, (total, current) => total + 1);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}
