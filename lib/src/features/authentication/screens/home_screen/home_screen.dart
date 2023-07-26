import 'package:fit_lab/src/features/authentication/screens/about_us_screen/contact.dart';
import 'package:fit_lab/src/features/authentication/screens/diet_screen/diet.dart';
import 'package:fit_lab/src/features/authentication/screens/excerises_screen/details_screen.dart';
import 'package:fit_lab/src/features/authentication/screens/health_tips_screen/tips.dart';
import 'package:fit_lab/src/features/authentication/screens/profile_screen/profile_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../BMI_screen.dart/BMI_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    // this.isDark,
  }) : super(key: key);

  // final bool isDark;
  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // var size = MediaQuery.of(context).size;
    // this gonna give us total height and width of our device
    final size = MediaQuery.of(context).size;
    isDark
        ? ({Colors.grey, Colors.white})
        : const Color.fromARGB(255, 190, 248, 2);
    return Scaffold(
      // drawer:const Drawer(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
          title: const Text(
            "Fit Lab",
            style: TextStyle(
              color: Color.fromARGB(255, 252, 252, 252),
              fontSize: 25,
            ),
          ),
          backgroundColor: isDark
              ? const Color.fromARGB(0, 252, 250, 250).withOpacity(0)
              : Colors.red.withOpacity(0.1),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => ProfileScreen());
                // AuthenticationRepository.instance.logout();
              },
              icon: CircleAvatar(
                backgroundColor:
                    isDark ? Colors.yellow : Colors.red.withOpacity(0.9),
                child: const Icon(
                  color: Color.fromARGB(255, 0, 0, 0),
                  Icons.person_2_outlined,
                ),
              ),
              // icon: Image(image: AssetImage(fhomeScreenProfileimage)),
            ),
          ]),
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
                  //Main tittle
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
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
                    child: const Text(
                      ' Fit Lab ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 80),
                    ),
                  ),
                  //Extra statement
                  const Text('\n'),
                  const Text(
                    'Make yourself FIT !! ',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Text('\n\n'),
                  //juz for some gap between the items
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: const Text(""),
                  ),
                  // for personal fitness base  recomendation
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: const BorderRadius.only(
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
                    child: SizedBox(
                      width: size.width - 10 ,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InputPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            child: Column(
                              children: <Widget>[
                                // Text('\n'),
                                // SvgPicture.asset('assets/icons/Hamburger.svg',
                                //     alignment: Alignment.bottomRight),
                                //Spacer(),
                                Text(
                                  ' PERSONAL FITNESS BASED ON BMI ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text('\n'),

                  //Now the main part starts here
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        //1st
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Diet()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Column(
                                  children: <Widget>[
                                    const Text('\n'),
                                    SvgPicture.asset(
                                        'assets/icons/Hamburger.svg',
                                        alignment: Alignment.bottomRight),
                                    //Spacer(),
                                    Text(
                                      '\n DIET ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(1)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //2nd
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(70.0),
                              bottomRight: Radius.circular(20.0),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Tips()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    SvgPicture.asset('assets/icons/yoga.svg',
                                        alignment: Alignment.bottomRight),
                                    Text(
                                      '\n HEALTH TIPS ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white.withOpacity(1)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //
                        //     //borderRadius: BorderRadius.circular(13),
                        //     child : Container(
                        //
                        //       //padding : EdgeInsets.all(20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(50),
                        //         color: Colors.white,
                        //
                        //           boxShadow: const [BoxShadow(offset: Offset(0,17),
                        //           blurRadius: 30,
                        //           spreadRadius: -50,
                        //           color: kShadowColor,
                        //         ),],
                        //       ),
                        //       child:Material(
                        //
                        //         color: Colors.transparent,
                        //         child:InkWell(
                        //           onTap: (){
                        //             Navigator.push(
                        //                             context,
                        //                             MaterialPageRoute(builder: (context) => const DetailsScreen()),
                        //                           );
                        //           },
                        //           child:Padding(
                        //
                        //             padding: const EdgeInsets.all(20.0),
                        //             child: Column(
                        //               children: <Widget>[
                        //
                        //                 Spacer(),
                        //                 SvgPicture.asset('assets/icons/Meditation.svg'),
                        //                 Spacer(),
                        //                 Text(
                        //                   ' Excercises ',
                        //                   textAlign: TextAlign.center,
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .titleSmall
                        //                   / !.copyWith(fontSize: 15),
                        //                 ),
                        //
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        // ),
                        //3rd
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topRight: Radius.circular(100.0),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailsScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 29.0),
                                child: Column(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assets/icons/Excrecises.svg',
                                        alignment: Alignment.bottomRight),
                                    Text(
                                      '\n\n EXERCISES ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(1)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //4th
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(70.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Contacts()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assets/icons/Meditation.svg',
                                        alignment: Alignment.bottomRight),
                                    Text(
                                      '\n CONTACT ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white.withOpacity(1)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// bottomNavigationBar: Container(
//   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//   height: 80,
//   color: Colors.white,
//   child: Row(
//     children: <Widget>[
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[SvgPicture.asset("assets/icons/calendar.svg"),
//         Text('Info'),
//         ],
//
//       )
//     ],
//   ),
// ),

// Align(
//   alignment: Alignment.topLeft,
//   child: Text('     Fit lab',
//   style: Theme.of(context)
//   .textTheme
//   .displayMedium
//   /!.copyWith(fontWeight: FontWeight.w900),
//   // style: TextStyle(
//   //     fontFamily: 'assets/fonts/Cairo/Cairo-Bold.ttf',
//   //   fontSize: 30.0,
//   //   fontWeight: FontWeight.w800,
//   ),

//),
// Align(
//   child : Text(' - Make yourself fit !!',
//       style: Theme.of(context)
//       .textTheme
//       .displaySmall
//   /!.copyWith(fontWeight: FontWeight.w400),
//   ),
// ),
// decoration: BoxDecoration(
//   color: Colors.white,
//   borderRadius: BorderRadius.circular(20.5),
// ),
// color: Colors.white,
// child: TextField(

// Navigator.push(context, MaterialPageRoute(builder: (context){return DetailsScreen();}),);
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context){
//   return const DetailsScreen();
// }),
// );


//     Container(
//       child : ElevatedButton(
//         child: const Text('Open route'),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const DetailsScreen()),
//           );
//         },
//       ),
//     )
// ],


//
//   child : Container(
//     alignment: Alignment.center,
//     height: 52,width: 52,
//     decoration: const BoxDecoration(
//         color: Color(0xFFF2BEA1),
//         shape: BoxShape.circle,
//   ),
//   child: SvgPicture.asset("assets/icons/menu.svg"),
// ),                      // CategoryCard(
//                       //   tittle: "Diet Recommendation",
//                       //   svgSrc: "assets/icons/Hamburger.svg",
//                       //   press: (){},
//                       // ),
// 
//                       // CategoryCard(
//                       //   tittle: "Health tips",
//                       //   svgSrc: "assets/icons/yoga.svg",
//                       //
//                       //     press: (){}
//                       // ),
























      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   leading: const Icon(
      //     Icons.menu,
      //     // color: isDark ? Colors.black: Colors.yellowAccent,
      //     color: Colors.black,
      //   ),
        
        //don't delete-------------------------------
        // actions: [
        //   Container(
        //     margin: const EdgeInsets.only(right: 20, left: 7),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       color: isDark
        //           /? const Color.fromARGB(255, 239, 239, 239)
        //           : Colors.amberAccent,
        //       // color:
        //     ),
        //     child: IconButton(
        //       onPressed: () {
        //         Get.to(() => const ProfileScreen());
        //         // AuthenticationRepository.instance.logout();
        //       },
        //       icon: Image(image: AssetImage(fhomeScreenProfileimage)),
        //     ),
        //   )
        // ],
      
    






   
