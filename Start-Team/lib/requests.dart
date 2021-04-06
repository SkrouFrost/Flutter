import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/requests_m.dart';
import 'Model/favorite_m.dart';
import 'request.dart' as request;
import 'main.dart';

class Glob {
  static var nupls;
  static var nupls2;
}

class RequestsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.black,
        child: Column(children: <Widget>[
          Container(),
          Expanded(
              child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _MyListItem(index);
                },
                childCount:48,
              ),
            ),
          ])),
          Container()
        ]));
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavorite = context.select<FavoriteModel, bool>(
        (favorite) => favorite.items.contains(item));
    return FlatButton(
      onPressed: isInFavorite
          ? null
          : () {
              var favorite = context.read<FavoriteModel>();
              favorite.add(item);
              favorite.starts();
            },
      splashColor: Colors.black,
      child: isInFavorite
          ? Icon(Icons.bookmark_sharp,
              semanticLabel: 'ADDED', color: Colors.yellow)
          : Icon(Icons.bookmark_outline_sharp,
              semanticLabel: 'ADD', color: Colors.yellow),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;
  Future<request.Album> futureAlbum = request.fetchAlbum();

  Widget request_button(idpush, id, context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          idpush,
          MaterialPageRoute(builder: (idpush) => RequestPage()),
        );
        Glob.nupls = id + 1;
      },
      elevation: 0.0,
      textColor: Colors.black,
      child: Text("  $context ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
    );
  }

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<RequestsModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
    // Glob.nupls=item.id +1;
    return ButtonTheme(
        height: 54.0,
        buttonColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Row(children: [
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                request_button(context, item.id, item.name),
                Divider(
                  height: 1,
                  color: Colors.black,
                )
              ])),
          Expanded(
              child: Container(
            color: Colors.yellow,
            height: 54,
          )),
          Container(child: _AddButton(item: item))
        ]));
  }
}
