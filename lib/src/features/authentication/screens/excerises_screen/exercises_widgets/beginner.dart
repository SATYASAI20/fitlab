import 'package:fit_lab/src/features/authentication/screens/excerises_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class Beginner extends StatelessWidget {
  const Beginner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeginnerExcercise(),
    );
  }
}

class BeginnerExcercise extends StatelessWidget {
  const BeginnerExcercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
      
        leading: IconButton(
          onPressed: () => Get.to(()=> const DetailsScreen()),
          icon:  CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.7),
            child: const Icon(
              LineAwesomeIcons.angle_left,
              size: 25,  
            ),
          ),
        ),
        title: const Text(fAppName),
        backgroundColor:
          isDark ? const Color.fromARGB(0, 252, 250, 250) : Colors.blue.withOpacity(0.4),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(fbackgroundImage),
            )),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const Text('\n\n'),
                  //name : begineer
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(70.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(70.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          blurRadius: 20.0,
                          offset: const Offset(3, 15),
                        ),
                      ],
                    ),
                    //heading
                    child: const Text(
                      ' BEGINNERS ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 40),
                    ),
                  ),
                  //space
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: const Text(""),
                  ),
                  //All the small ones
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const <Widget>[
                        //1st
                        BeginnersWidget(
                          rimage: 'assets/images/beginner/jogging.png',
                          rname: '\n Jogging',
                          rtime: ' For 30mins',
                        ),
                        //2nd
                        LeftBeginnersWidget(limage: 'assets/images/beginner/skipping.jpg', lname: '\n SKIPPING ROPE ', ltime:  ' 40times * 2sets'),
                        //3rd
                        LeftBeginnersWidget(limage: 'assets/images/beginner/squats.jpg',lname:'\n SQUATS ' ,ltime: '2sets * 15times',),
                        //4th
                        BeginnersWidget(rimage:'assets/images/beginner/flutterKicks.jpg' , rname: '\n FLUTTER KICKS ', rtime: ' left and right 2*30'),
                        //6th
                        LeftBeginnersWidget(limage: 'assets/images/beginner/lunges.jpg', lname: '\n LUNGES ', ltime: '2*15 left and right'),
                        //7th
                        BeginnersWidget(rimage: 'assets/images/beginner/sideKicks.jpg', rname: '\nSIDE LYING LEG LIFTS ', rtime:'2sets * 15times' ),
                        //8th
                        LeftBeginnersWidget(limage: 'assets/images/beginner/plank.jpg', lname: '\n PLANK ', ltime: ' 30 secs'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LeftBeginnersWidget extends StatelessWidget {
  const LeftBeginnersWidget({
    super.key,
    required this.limage, 
    required this.lname, 
    required this.ltime,
  });
  final String limage;
  final String lname;
  final String ltime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(70.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(70.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2),
            blurRadius: 20.0,
            offset: const Offset(5, 15),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                const Text('\n'),
                Image(
                    image:AssetImage(limage),// AssetImage('assets/images/beginner/squats.jpg'),
                    height: 70,
                    width: 70,
                    fit: BoxFit.fitHeight),
                //Spacer(),
                Text(
                  lname,//'\n SQUATS ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                Text(
                  ltime,  // ' 2sets * 15times',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeginnersWidget extends StatelessWidget {
  const BeginnersWidget({
    super.key,
    required this.rimage,
    required this.rname,
    required this.rtime,
  });
  final String rimage;
  final String rname;
  final String rtime;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        color: Colors.blue.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(70.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(50.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2),
            blurRadius: 20.0,
            offset: const Offset(5, 15),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.only(left:3.0,right: 5,top:0,bottom: 1 ),
            child: Column(
              children: <Widget>[
                const Text('\n'),
                Image(
                    image: AssetImage(
                        rimage), //AssetImage('assets/images/beginner/jogging.png')
                    height: 70,
                    width: 70,
                    fit: BoxFit.fitHeight),
                //Spacer(),
                Text(
                  rname, //'\n Jogging'
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                Text(
                  rtime, // ' For 30mins',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
