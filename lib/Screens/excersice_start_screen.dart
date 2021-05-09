import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'excercise_screen.dart';
import 'excersicisehub_dart.dart';

class ExcerciseStartScreen extends StatefulWidget {
  final Exercises exercises;
  ExcerciseStartScreen({this.exercises});
  @override
  _ExcerciseStartScreenState createState() => _ExcerciseStartScreenState();
}

class _ExcerciseStartScreenState extends State<ExcerciseStartScreen> {
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        /*child: Image(
          image: NetworkImage(widget.exercises.thumbnail),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),*/
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context, url) => Image(
                image: AssetImage('assets/placeholder.png'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                width: 200,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(),
                  onChange: (double value) {
                    seconds = value.toInt();
                  },
                  initialValue: 30,
                  min: 10,
                  max: 60,
                  innerWidget: (v) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${v.toInt()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExcerciseScreen(
                              exercises: widget.exercises, seconds: seconds)));
                },
                child:
                Text('Start Excercise', style: TextStyle(fontSize: 20.0)),
                color: Colors.deepOrange,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                splashColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
