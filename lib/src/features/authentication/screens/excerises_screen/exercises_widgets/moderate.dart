import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../details_screen.dart';

class Moderate extends StatelessWidget {
  const Moderate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModerateScreen(),
    );
  }
}

class ModerateScreen extends StatelessWidget {
  const ModerateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => const DetailsScreen());
          },
          icon: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.7),
            child: const Icon(
              LineAwesomeIcons.angle_left,
              size: 25,
            ),
          ),
        ),
        title: const Text(fAppName),
        backgroundColor: isDark
            ? const Color.fromARGB(0, 252, 250, 250)
            : Colors.blue.withOpacity(0.4),
      ),
      body: Stack(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(fbackgroundImage),
              )),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      // height: 50,
                      child: Container(
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
                          ' INTERMEDIATE  ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 35),
                        ),
                      ),
                    ),
                    //space
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: const Text(""),
                    ),

                    Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: const <Widget>[
                          //1st
                          IntermediateRightWidget(
                            rimage: 'assets/images/moderate/bicyleCrunches.jpg',
                            rname: '\n BICYCLE CRUNCHES ',
                            rtime: ' 3 sets * 20 times',
                          ),
                          //2nd
                          IntermediateLeftWidget(
                              limage: 'assets/images/moderate/pushups.jpg',
                              lname: '\n PUSH UPS ',
                              ltime: ' 2 sets * 30 times'),
                          //3rd
                          IntermediateRightWidget(
                              rimage: 'assets/images/moderate/deadlift.jpg',
                              rname: '\n DEADLIFT  ',
                              rtime: ' 15 to 20 kgs'),

                          //4th
                          IntermediateLeftWidget(
                              limage: 'assets/images/moderate/jumpingJacks.jpg',
                              lname: '\n JUMPING JACKS ',
                              ltime: ' 3 * 20times'),

                          //5th
                          IntermediateRightWidget(
                              rimage:
                                  'assets/images/moderate/jumpingLunges.jpg',
                              rname: '\n JUMPING\nLUNGES ',
                              rtime: ' 2sets * 20times'),

                          //6th
                          IntermediateLeftWidget(
                              limage:
                                  'assets/images/moderate/advancedPlank.jpg',
                              lname: '\nADVANCED PLANK  ',
                              ltime: '2 to 3 mins'),

                          //7th
                          IntermediateRightWidget(
                              rimage:
                                  'assets/images/moderate/advancedPlankweights.jpg',
                              rname: '\n ADVANCED SQUATS WITH WEIGHTS ',
                              rtime: ' 2sets * 12times'),

                          //8th
                          IntermediateLeftWidget(
                              limage: 'assets/images/moderate/dumbell.jpg',
                              lname: '\n DUMBELL WEIGHT LIFT ',
                              ltime: ' 3sets * 12 times'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IntermediateLeftWidget extends StatelessWidget {
  const IntermediateLeftWidget({
    super.key,
    required this.limage,
    required this.lname,
    required this.ltime,
  });
  final String limage, lname, ltime;

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
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                const Text('\n'),
                Image(
                    image: AssetImage(
                        limage), //'assets/images/moderate/pushups.jpg'
                    height: 70,
                    width: 70,
                    fit: BoxFit.fitHeight),
                //Spacer(),
                Text(
                  lname, //'\n PUSH UPS ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                Text(
                  ltime, //' 2 sets * 30 times',
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

class IntermediateRightWidget extends StatelessWidget {
  const IntermediateRightWidget({
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
            padding:
                const EdgeInsets.only(left: 3.0, right: 5, top: 0, bottom: 0),
//  padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                const Text('\n'),
                Image(
                    image: AssetImage(rimage),
                    height: 60,
                    width: 70,
                    fit: BoxFit.fitHeight),
                //Spacer(),
                Text(
                  rname, //'\n BICYCLE CRUNCHES ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                Text(
                  rtime, //' 3 sets * 20 times',
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
