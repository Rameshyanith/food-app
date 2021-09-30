import 'package:flutter/material.dart';
import 'package:food/screens/getting_start.dart';
import 'package:food/utils/constants.dart';
import 'package:food/utils/utils_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      UtilFunctions.navigateTo(context, Gettingstart());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xE5E5E5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.imageAssest("food.png")),
            const SizedBox(height: 8),
            const Text(
              "No waiting for food",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff838383),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
