import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation curve1;
  Animation curve2;
  Animation curve3;
  Animation<double> change_size1;
  Animation<double> change_size2;
  Animation<double> change_size3;
  Animation<double> change_transparency;
  Animatable<Color> change_color;
  Animatable<Color> change_color2;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    curve1 = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    curve2 = CurvedAnimation(parent: controller, curve: Curves.easeInQuad);
    curve3 = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    change_size1 = Tween<double>(begin: 0, end: 290).animate(curve1)
      ..addListener(() {
        setState(() {
        });
      });
    change_size2 = Tween<double>(begin: 0, end: 36).animate(curve2)
      ..addListener(() {
        setState(() {
        });
      });
    change_size3 = Tween<double>(begin: 24, end: 240).animate(curve3)
      ..addListener(() {
        setState(() {
        });
      });
    change_transparency = Tween<double>(begin: 1, end: 0.6).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
    change_color = TweenSequence<Color>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.yellowAccent,
            end: Colors.red,
          ),
        ),
      ],
    );
    change_color2 = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 2.0,
        tween: ColorTween(
          begin: Colors.purple,
          end: Colors.pink,
        ),
      )
    ]);

    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 48, 0, 0),
                width: change_size1.value,
                height: change_size2.value,
                color: change_color
                    .evaluate(AlwaysStoppedAnimation(controller.value)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 48, 24, 0),
                width: change_size2.value,
                height: change_size1.value,
                color: change_color2
                    .evaluate(AlwaysStoppedAnimation(controller.value)),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Container(
                margin: EdgeInsets.only(left: 24),
                width: change_size3.value,
                height: 30,
                color: Colors.indigo.withOpacity(change_transparency.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
