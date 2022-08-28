import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confess_app/confess.dart';
import 'package:confess_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';

//Item data model
class ItemData {
  final Color color;
  final String image;
  final String text1;

  ItemData(
    this.color,
    this.image,
    this.text1,
  );
}

class Content extends StatefulWidget {
  final String name;
  Content({Key? key, required this.name}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int page = 0;

  LiquidController liquidController = LiquidController();

  List<ItemData> data = [
    ItemData(Color.fromRGBO(255, 183, 196, 1), "bunny-couple.json",
        "I fell in love with you the day I met you"),
    ItemData(Color.fromRGBO(255, 227, 227, 1), "bunny-squeeze.json",
        "You know you're in love when you can't feel asleep because reality is finally better than dreams"),
    ItemData(Color.fromRGBO(225, 239, 242, 1), "unicorn-popcorn.json",
        "I don't need immortality, you're my forever")
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: data[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Lottie.asset(
                        data[index].image,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${widget.name},",
                              style: GoogleFonts.loveLight(
                                  textStyle: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Text(
                              data[index].text1,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.loversQuarrel(
                                  textStyle: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              positionSlideIcon: 0.8,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              fullTransitionValue: 880,
              enableSideReveal: false,
              enableLoop: false,
              ignoreUserGestureWhileAnimating: false,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(data.length, _buildDot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
      print(lpage);
      Future.delayed(const Duration(seconds: 5), () {
        if (page == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Confess()),
          );
        }
      });
    });
  }
}
