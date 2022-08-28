import 'package:confess_app/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Confess App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
      child: Column(
        children: [
          Lottie.asset("quiz-animation.json"),
          Text(
            "Let's Play Quiz!",
            style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(fontSize: 30)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: TextFormField(
              textDirection: TextDirection.ltr,
              controller: _name,
              style: GoogleFonts.robotoSlab(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600)),
              decoration: InputDecoration(
                focusColor: Colors.white,
                prefixIcon: const Icon(Icons.person),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                fillColor: Colors.grey,
                hintText: "Name",
                hintStyle: GoogleFonts.robotoSlab(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.w400)),
                labelText: 'Name',
                //lable style
                labelStyle: GoogleFonts.robotoSlab(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          ScaleTap(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Error404(
                        name: _name.text,
                      ),
                    ));
              },
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
                  "Let's Go!!",
                  style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600)),
                )),
              ))
        ],
      ),
    ));
  }
}

//ERROR 404 PAGE
class Error404 extends StatelessWidget {
  final String name;
  const Error404({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Lottie.asset('error404.json',frameRate: FrameRate(120),height: 400),
          Text(
            "Could not retrieve information",
            style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 25,
          ),
          ScaleTap(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Content(
                        name: name,
                      ),
                    ));
              },
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
                  "Reconnect",
                  style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600)),
                )),
              ))
        ],
      )),
    );
  }
}
