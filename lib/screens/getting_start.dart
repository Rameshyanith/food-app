import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/constants.dart';
import 'package:food/utils/utils_function.dart';

class Gettingstart extends StatefulWidget {
  const Gettingstart({Key? key}) : super(key: key);

  @override
  _GettingstartState createState() => _GettingstartState();
}

class _GettingstartState extends State<Gettingstart> {
  CarouselController carouselController = CarouselController();
  List<Widget> list = [
    Slider(
        img: "popcorn 1.png",
        text1: "Choose A Tasty Dish",
        text2: "Order anything you want from your \n favorite resturent"),
    Slider(
      img: "money 1.png",
      text1: "Easy payment",
      text2:
          "Payment made easy through debit\n card,credit card & more ways to pay \n for your food",
    ),
    Slider(
      img: "restaurant 1.png",
      text1: "Enjoy the Taste",
      text2:
          "Healthy eating means eating a variety\n of foods that give you the nutrients you \n need to maintain your health",
    ),
  ];
  int _current = 0;
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
            CarouselSlider(
              options: CarouselOptions(
                  height: size.height / 2,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              carouselController: carouselController,
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        children: [i],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == entry.key ? primarycolor : greycolor),
                  ),
                );
              }).toList(),
            ),
            BottomSection(
              size: size,
              ontap: () => carouselController.nextPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String img;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Constants.imageAssest(img),
        ),
        SizedBox(
          height: 37,
        ),
        Text(
          text1,
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: greycolor,
          ),
        ),
      ],
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
    required this.size,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            Constants.imageAssest("bottom.png"),
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: 39,
            right: 43,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: ontap,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: kBlack,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "skip",
                    style: TextStyle(
                      color: kBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
