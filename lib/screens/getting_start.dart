import 'package:flutter/material.dart';
import 'package:food/utils/constants.dart';

class Gettingstart extends StatefulWidget {
  const Gettingstart({Key? key}) : super(key: key);

  @override
  _GettingstartState createState() => _GettingstartState();
}

class _GettingstartState extends State<Gettingstart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(
                    Constants.imageAssest("bottom.png"),
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
