import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var Pages=[
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/1.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/2.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/3.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body: "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/4.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnBoard'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: Pages,
        onDone: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomeScreen()));
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.arrow_right),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
      ),




    );
  }
}

