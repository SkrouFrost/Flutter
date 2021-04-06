import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      padding: EdgeInsets.all(24.0),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 24,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_foy0hufVSAAKCsCv87SOMrIl3qCEfp_Lmg&usqp=CAU',
                  ),
                  height: MediaQuery.of(context).size.width *0.45,
                  width: MediaQuery.of(context).size.width *0.45,
                ),

                RaisedButton(
                  color: Colors.yellow,
                  child: Text('Завантажити'),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 18,),
            TextFormField(
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                  hintText: 'Ім\'я',
                  hintStyle: TextStyle(color: Colors.yellow),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow))),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
            ),
            TextFormField(
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                  hintText: 'Прізвище',
                  hintStyle: TextStyle(color: Colors.yellow),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow))),
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
            ),
            TextFormField(
              style: TextStyle(color: Colors.yellow),
              decoration: InputDecoration(
                  hintText: 'По батькові',
                  hintStyle: TextStyle(color: Colors.yellow),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow))),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'Ваші сильні й слабкі сторони:',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                ),
              ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  style: TextStyle(color: Colors.yellow, fontSize: 18,),
                    maxLines: 10,
                  minLines: 2,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      ),
                ),
            ],),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Отримана освіта:',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  style: TextStyle(color: Colors.yellow, fontSize: 18,),
                  maxLines: 10,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '(Назва заладу, роки навчання, спеціальність)',
                    hintStyle: TextStyle(color: Colors.yellow),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                  ),
                ),
              ],),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Досвід роботи:',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  style: TextStyle(color: Colors.yellow, fontSize: 18,),
                  maxLines: 10,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '(Назва заладу, роки роботи, посада, причина звільнення)',
                    hintStyle: TextStyle(color: Colors.yellow),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                  ),
                ),
              ],),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              color: Colors.yellow,
              child: Text('Зберегти'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
            ),
          ],
        ),
      )),
    ));
  }
}
