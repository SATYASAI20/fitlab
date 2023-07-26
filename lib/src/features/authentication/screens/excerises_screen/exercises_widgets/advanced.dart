import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../details_screen.dart';

class AdvancedS extends StatelessWidget {
  const AdvancedS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdvancedScreen(),
    );
  }
}

class AdvancedScreen extends StatelessWidget {
  const AdvancedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // var size2 = MediaQuery.of(context).size;
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
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(fbackgroundImage),
            )),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const Text('\n\n'),
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
                      ' ADVANCED ',
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

                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children:const <Widget>[
                        //1st
                         AdvanceleftWidget(
                          limage: 'assets/images/advanced/crunches.jpg',
                          ltext: '\n CRUNCHES',
                        ),
                        //2nd
                         AdvanceRightWidget(rimage: 'assets/images/advanced/dumbell',rtext:'\n DUMBELL WEIGHT LIFT ',),
                        //3rd
                         AdvanceleftWidget(limage: 'assets/images/advanced/hanging.jpg', ltext: '\n HANGING LEG RAISE '),
                        //4th
                         AdvanceRightWidget(rimage: 'assets/images/advanced/legraise.jpg', rtext: '\n LEG RAISE and HOLD '),
                        //5th
                         AdvanceleftWidget(limage: 'assets/images/advanced/plank.jpg' , ltext:   '\n PUSHUPS AND PLANK '),
                        
                        //6th
                         AdvanceRightWidget(rimage: 'assets/images/advanced/sittups.jpg', rtext: '\n SITTUPS ',),
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

class AdvanceRightWidget extends StatelessWidget {
  const AdvanceRightWidget({
    super.key,
    required this.rimage,
    required this.rtext,
  });
  final String rimage, rtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(70.0),
          bottomRight: Radius.circular(20.0),
          topRight: Radius.circular(70.0),
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
                    image:
                        const AssetImage('assets/images/advanced/dumbell.jpg'),
                    height: 70,
                    width: 70,
                    fit: BoxFit.fitHeight),
                //Spacer(),
                Text(
                  rtext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                // Text(
                //   '',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.6)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdvanceleftWidget extends StatelessWidget {
  const AdvanceleftWidget({
    super.key,
    required this.limage,
    required this.ltext,
  });
  final String limage, ltext;
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
                  image: AssetImage(limage),
                  height: 70,
                  width: 70,
                  fit: BoxFit.fitHeight,
                ),
                //Spacer(),
                Text(
                  ltext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(1)),
                ),
                Text(
                  ' ',
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
