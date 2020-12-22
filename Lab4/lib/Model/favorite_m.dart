import 'package:flutter/foundation.dart';
import 'package:poetry/Model/history_m.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteModel extends ChangeNotifier {
  HistoryModel _history;

  List<int> _itemIds = [];

  HistoryModel get history => _history;

  set history(HistoryModel newHistory) {
    assert(newHistory != null);
    assert(_itemIds.every((id) => newHistory.getById(id) != null),
        'The history $newHistory does not have one of $_itemIds in it.');
    _history = newHistory;
    notifyListeners();
  }

  List<int> clone = [];

  int get totalScore => items.fold(0, (total, current) => total + 1);

  void add(Item item) async {
    _itemIds = []..addAll(clone);
    _itemIds.add(item.id);
    setListData("key", _itemIds);   
    notifyListeners();
  }

  starts() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    List<String> savedStrList = myPrefs.getStringList("key");
    List<int> intSavedList = savedStrList.map((i) => int.parse(i)).toList();
    print("GETTER \n ${intSavedList.toString()}");
    clone = []..addAll(intSavedList);
    notifyListeners();
  }

  List<Item> get items => clone.map((id) => _history.getById(id)).toList();

  setListData(String key, List<int> value) async {
    List<String> strList = _itemIds.map((i) => i.toString()).toList();
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setStringList("key", strList);
    print("SETTER \n ${strList.toString()}");
  }
}
