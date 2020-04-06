import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @author Waseem SK

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hindi Riddles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hindi Riddles (पहेलियाँ) for kids'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color accentColor = Colors.blue;
  Color textColor = Colors.white;

  //todo list of Q&A
  List<String> abcd = ["abc", "def", "ghi", "jkl", "पहेलियाँ"];

  void showToast(BuildContext context, String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        gravity: ToastGravity.BOTTOM,
        textColor: textColor,
        webBgColor: "#2196F3",
        webPosition: "right",
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Swiper(
            autoplay: false,
            itemCount: abcd.length,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Container(
                  width: getDimen(context),
                  height: getDimen(context),
                  child: Card(
                    color: accentColor,
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        //todo pass answer here
                        showToast(context, abcd[index]);
                      },
                      child: Center(
                        child: Text(
                          //todo pass question here
                          abcd[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 32, color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  double getDimen(BuildContext context) {
    return min(screenHeight(context), screenWidth(context)) * 0.8;
  }
}
