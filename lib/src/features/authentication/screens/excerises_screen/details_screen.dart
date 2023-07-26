import 'package:fit_lab/src/features/authentication/screens/excerises_screen/exercises_widgets/advanced.dart';
import 'package:fit_lab/src/features/authentication/screens/excerises_screen/exercises_widgets/beginner.dart';
import 'package:fit_lab/src/features/authentication/screens/excerises_screen/exercises_widgets/moderate.dart';
import 'package:fit_lab/src/features/authentication/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercises',

      home: ExerciseScreen(),
    );
  }
}

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  var size1= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        leading: IconButton(
          onPressed: () => Get.to(()=>const HomeScreen()),
          icon:   CircleAvatar(
            backgroundColor:  Colors.red.withOpacity(0.3),
            child:  const Icon(
              LineAwesomeIcons.angle_left,
              size: 25,  
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[

          Container(
            decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(fbackgroundImage),
                )
            ),
            child: SafeArea(
              child: Column(
                children:<Widget>[
                  Container(

                    decoration: BoxDecoration(

                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(70.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(70.0),
                      ),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 20.0,
                            offset: const Offset(3,15),
                      ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: const Text('Excerises',
                      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black87),),
                  ),
                  const Text('\n\n'),
                  Container(

                    decoration: BoxDecoration(

                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(70.0),
                        bottomRight: Radius.circular(20.0),
                        topRight: Radius.circular(70.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 20.0,
                          offset: const Offset(3,15),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: const Text('Select one to train',
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black87),),
                  ),


                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    child: const Text(""),),

                  Expanded(
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 4.5 ,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          // 1st - Beginner
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),

                                boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.3),
                                      blurRadius: 20.0,
                                      offset: const Offset(3,15),
                               ),
                                ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Beginner()),);},

                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: <Widget>[
                                        Image(image:const AssetImage('assets/images/common_images/images/yoga.png'),
                                          fit: BoxFit.fitHeight,),
                                        const Text('         BEGINNER      ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black87),
                                        ),
                                        const Text('      >>', style: TextStyle(fontSize: 25,color: Colors.red),)],),),),),),),
                          // 2nd - Moderate
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 20.0,
                                  offset: const Offset(3,15),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Moderate()),);},

                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children:  <Widget>[
                                        Image(image: const AssetImage('assets/images/common_images/images/yoga.png'),
                                          fit: BoxFit.fitHeight,),
                                        const Text('       INTERMEDIATE',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black87),
                                        ),
                                        const Text('      >>', style: TextStyle(fontSize: 20,color: Colors.red),)],),),),),),),
                          // 3rd - Advanced
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.3),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 20.0,
                                  offset: const Offset(3,15),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const AdvancedS()),);},

                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children:  <Widget>[
                                        Image(image:const  AssetImage('assets/images/common_images/images/yoga.png'),
                                          fit: BoxFit.fitHeight,),
                                        const Text('          ADVANCED   ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black87),
                                        ),
                                        const Text('      >>', style: TextStyle(fontSize: 20,color: Colors.red),)],),),),),),),



                        ],

                      )

                  ),

                ]

              ),

            ),
          ),


        ],
      ),
    );
  }
}




