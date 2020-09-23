class Books {
  String nameb;
  int _code;
  var sell = ['Three Musketeers', 'Dairy of Madman'];

  Books.shevchenko()
      : nameb = "Kobzar",
        _code = 1840;

  Books(this.nameb, this._code);

  Function collections() {
    sell.add(nameb ??= "");
  }

  void display() {
    print("Name: $nameb Code: $_code \n Sell books: $sell");
  }


}

class characters extends Books with YouTry {
  String _name;

  void set name(String c) => _name;

  String get name => _name;

  collections() {
    Map <String, List<String>> way = {
      'Dom': ['Red', 'Sphinx', 'Blind'],
      'Hobbit': ['Bilbo', 'Smaug', 'Sauron', 'Tror']
    };
    for (var item in way.keys) {
      print("key = $item, value = ${way[item]}");
    }
  }

  characters(String nameb, int code) : super(nameb, code);

  void parents() {
    super.display();
  }
}

mixin YouTry{
  void display() {
    print("It`s just an example");
  }
}