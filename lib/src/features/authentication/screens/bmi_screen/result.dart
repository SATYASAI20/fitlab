// ignore_for_file: prefer_const_constructors

import 'package:fit_lab/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';

import 'package:fit_lab/src/features/authentication/screens/excerises_screen/exercises_widgets/advanced.dart';
import 'package:get/get.dart';

import '../Diet plans/DietPlan_A.dart';
import '../Diet plans/DietPlan_B.dart';
import '../Diet plans/DietPlan_C.dart';
import '../excerises_screen/exercises_widgets/beginner.dart';
import '../excerises_screen/exercises_widgets/moderate.dart';
import 'calculation.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  int height;
  int weight;
  int age;
  // ignore: use_key_in_widget_constructors
  ResultPage({required this.height, required this.weight, required this.age});

  @override
  // ignore: library_private_types_in_public_api
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmires = 0;
  //int bmiAge = Age;
  @override
  void initState() {
    Logic l = Logic();
    bmires = l.calculateBMI(widget.height, widget.weight);
    super.initState();
  }

  double homeResult() {
    return bmires;
  }

  String result = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const HomeScreen());
                // AuthenticationRepository.instance.logout();
              },
              icon: CircleAvatar(
                backgroundColor:Color.fromARGB(255, 242, 140, 174).withOpacity(0.9),
                child: const Icon(
                  color: Color.fromARGB(255, 0, 0, 0),
                  Icons.person_2_outlined,
                ),
              ),
              // icon: Image(image: AssetImage(fhomeScreenProfileimage)),
            ),
          ],
        
        // : IconButton(
        //   onPressed: (){


        //   },
        //   icon: const Icon(LineAwesomeIcons.angle_right),
        // ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        
        child: Container(
          color: Colors.black87,
          child: Center(
            child: Column(
      
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "YOUR BMI RESULT IS :",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                Text(
                  result = bmires.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 44, 196, 27)),
                ),
      
                Text('\n'),
                //Plan 1
                Text(
                  " If BMI < 18 : Please follow this plan --\n",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
      
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Beginner()),
                          );
                        },
                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Exercise plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Dietplan_A()),
                          );
                        },
                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Diet plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
      
                SizedBox(height: 10,),
                //Plan 2
                Text(
                  " If  18 < BMI < 28 : Please follow this plan --\n",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
      
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),

                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Moderate()),
                          );
                        },

                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Exercise plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DietplanB()),
                          );
                        },
                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Diet plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                //Plan 3
                Text(
                  " If BMI > 29 : Please follow this plan --\n",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                // SizedBox(height: 5,),
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AdvancedScreen()),
                          );
                        },
                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Exercise plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 55,
                  width: size.width-50,
                  child: Container(
                      
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child:Material(
                      
                      color: Colors.transparent,
                      child:InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DietplanC()),
                          );
                        },
                        child:Padding(
                      
                          padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          child: Column(
                            children: <Widget>[
                              // Text('\n'),
                              // SvgPicture.asset('assets/icons/Hamburger.svg',
                              //     alignment: Alignment.bottomRight),
                              //Spacer(),
                              Text(
                                ' Diet plan ',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(1)),
                              ),
                      
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     // Get.to(()=>AdvancedScreen() );
                //   },
                //   child: Text(
                //     'Let\'s get Start..! ',
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black,
                //     ),
                //   ),
                // ),
      
                // Text(
                //   "rhii",
                //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   '${widget.age}',
                //   style: TextStyle(
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.pink),
                // ),
      
      
              ],
            ),
          ),
        ),
      ),

    );
  }
}

