import 'package:flutter/material.dart';

class MyRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container ( color: Colors.black,          padding: EdgeInsets.all(48.0),
          child: Center(
              child:SingleChildScrollView(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Реєстрація\n',
                      style:TextStyle(color: Colors.yellow,
                          fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    TextFormField(
                      style: TextStyle(color:Colors.yellow),
                      decoration: InputDecoration(
                          hintText: 'Пошта',
                          hintStyle: TextStyle(color: Colors.yellow),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
                      ),
                    ),
                    Container(padding: const EdgeInsets.all(4.0),),
                    TextFormField(
                      style: TextStyle(color:Colors.yellow),
                      decoration: InputDecoration(
                          hintText: 'Пароль',
                          hintStyle: TextStyle(color: Colors.yellow),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
                      ),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    RaisedButton(
                      color: Colors.yellow,
                      child: Text('Зареєструватися'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/form');
                      },
                    ),
                    TextButton(child: Text('Вже є аккаунт?',
                        style:TextStyle(color: Colors.yellow, decoration: TextDecoration.underline,
                            fontSize: 12)),
                        onPressed:(){Navigator.pushReplacementNamed(context, '/');}
                    ),

                  ],
                ),)

          ),)
    );
  }
}
