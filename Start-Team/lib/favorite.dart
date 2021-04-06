import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:st/Model/favorite_m.dart';
import 'package:st/requests.dart';

import 'main.dart';

class FavoriteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.black,
        child: Column(children: [
          Expanded(
            child: _favoriteList(),
          ),
          // _favoriteTotal(),
        ]));
  }
}

class _favoriteList extends StatelessWidget {
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
      child: Row(
        children: <Widget>[
          Text("  $context ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<FavoriteModel>();
    return ListView.builder(
      itemCount: favorite.items.length,
      itemBuilder: (context, index) => ButtonTheme(
          height: 54.0,
          buttonColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            request_button(
                context, favorite.items[index].id, favorite.items[index].name),
            Divider(
              height: 1,
              color: Colors.black,
            ),
          ])),
    );
  }
}

// class _favoriteTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var hugeStyle =
//         Theme.of(context).textTheme.headline3.copyWith(fontSize: 18);
//
//     return SizedBox(
//       height: 140,
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<FavoriteModel>(
//                 builder: (context, favorite, child) => Text(
//                     'Відмічених заявок: ${favorite.totalScore}',
//                     style: hugeStyle)),
//             SizedBox(width: 24),
//             FlatButton(
//               onPressed: () {
//                 Scaffold.of(context).showSnackBar(SnackBar(
//                     content: Text('Вибачте, це зараз недоступно(',
//                         style: TextStyle(
//                             fontSize: 12, fontWeight: FontWeight.w900))));
//               },
//               color: Colors.white,
//               child: Text('Очистити',
//                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
