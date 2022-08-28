import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Confess extends StatefulWidget {
  const Confess({Key? key}) : super(key: key);

  @override
  State<Confess> createState() => _ConfessState();
}

class _ConfessState extends State<Confess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Lottie.asset("wedding.json"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTap(
                  onPressed: () {},
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-1, 1),
                          end: Alignment(1, 1),
                          colors: [
                            Color(0xFFE6E6E6),
                            Color(0xFFFFFFFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffcccccc),
                              blurRadius: 40,
                              offset: Offset(20, 20)),
                          BoxShadow(
                              color: Color(0xffffffff),
                              blurRadius: 40,
                              offset: Offset(-20, -20))
                        ]),
                    child: Center(
                        child: Text(
                      "Yes!",
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600)),
                    )),
                  )),
              SizedBox(
                width: 30,
              ),
              ScaleTap(
                  onPressed: () {},
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(-1, 1),
                          end: Alignment(1, 1),
                          colors: [
                            Color(0xFFE6E6E6),
                            Color(0xFFFFFFFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffcccccc),
                              blurRadius: 40,
                              offset: Offset(20, 20)),
                          BoxShadow(
                              color: Color(0xffffffff),
                              blurRadius: 40,
                              offset: Offset(-20, -20))
                        ]),
                    child: Center(
                        child: Text(
                      "Absolutely!",
                      style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600)),
                    )),
                  ))
            ],
          )
        ],
      )),
    );
  }
}
