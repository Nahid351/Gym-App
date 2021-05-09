import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'excersice_start_screen.dart';
import 'excersicisehub_dart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiUrl =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';
  Excercisehub excerciseHub;

  @override
  void initState() {
    super.initState();
    getExcercises();
  }

  // Future Builder
  void getExcercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;
    // Encode and decode
    var decodeJson = jsonDecode(body);
    excerciseHub = Excercisehub.fromJson(decodeJson);
    setState(() {
      // use for update
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness App'),
      ),
      body: Container(
        child: excerciseHub != null
            ? ListView(
          children:excerciseHub.exercises.map((e) {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: FadeInImage(
                      image: NetworkImage(e.thumbnail),
                      placeholder: AssetImage('assets/placeholder.png'),
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000),
                            Color(0x00000000),


                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>ExcerciseStartScreen(exercises: e,)));
            },
                    child: Hero(
                      tag: e.id,
                      child: Container(
                       height: 255,
                        padding: EdgeInsets.only(left: 10.0,bottom: 10.0),
                        alignment:Alignment.bottomLeft,
                        child: Text(e.title,style: TextStyle(fontSize: 20.0,color: Colors.white),),


                      ),
                    ),
                  ),
                ],
              )

            );
          }).toList(),

        )
            : LinearProgressIndicator(),
      ),
    );
  }
}
