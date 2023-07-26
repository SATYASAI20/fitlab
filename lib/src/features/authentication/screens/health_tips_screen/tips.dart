import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthTips(),
    );
  }
}

class HealthTips extends StatefulWidget {
  const HealthTips({Key? key}) : super(key: key);

  @override
  State<HealthTips> createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController=PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.9),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:   CircleAvatar(
            backgroundColor: Colors.greenAccent.withOpacity(0.3),
            child:  const  Icon(
              
              LineAwesomeIcons.angle_left,
              size: 25,  
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/common_images/images/food.jpg'),
            )
        ),
        child: SafeArea(

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: demo_data.length,
                      controller: _pageController,
                      itemBuilder: (context,index)=>
                          OnboardContent(
                            image: demo_data[index].image,
                            tittle: demo_data[index].title,
                            discription: demo_data[index].discription,
                          ),),
                  ),
                  Row(
                    children: [
                      Container(height: 12, width: 4,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                      ),
                      const Spacer(),
                      SizedBox(height: 60,width: 60,
                        child: ElevatedButton(
                          
                          onPressed: (){
                            _pageController.nextPage(duration: const Duration(milliseconds: 300) , curve: Curves.ease);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const CircleBorder(),
                          ),
                          child: SvgPicture.asset("assets/icons/arrow.svg",
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),

    );
  }
}


class OnBoard{
  final String image, title, discription;

  OnBoard({
    required this.image,
    required this.title,
    required this.discription,
  });

}

// ignore: non_constant_identifier_names
final List<OnBoard> demo_data = [
  OnBoard(
    image: 'assets/images/common_images/images/course1.jpg',
    title: 'Physical health tips',
    discription: "1.Get enough sleep and Exercise regularly\n2.Stretch regularly\n3.Stay Hydrated\n4.Eat a balanced diet\n5.Take breaks from sitting\n6.Manage stress",
  ),
  OnBoard(
    image: 'assets/images/TipsPics/foodtips.jpg',
    title: 'Food Health Tips',
    discription: '1.Eat variety of foods\n2.Inlcude Vegetables and fruits\n3.Choose whole grains\n4.Limit processed foods\n5.Do not skips meals',
  ),
  OnBoard(
    image: 'assets/images/TipsPics/mentaltips.jpg',
    title: 'Mental Health tips',
    discription: '1.Practice self-care\n2.Exercise regularly\n3.Get enough sleep\n4.Learn stress management\n5.Practice gratitude',
  ),
];



class OnboardContent extends StatelessWidget {
  const OnboardContent({Key? key, required this.image, required this.tittle, required this.discription}) : super(key: key);

  final String image, tittle, discription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(image,height: 150,),
        const Text('\n'),
        Container(
          decoration: BoxDecoration(

            color: Colors.lightBlueAccent.withOpacity(0.6),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(70.0),
              bottomRight: Radius.circular(20.0),
              topRight: Radius.circular(70.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                blurRadius: 2.0,
                offset: const Offset(1,3),
              ),
            ],
          ),
          child: Text(tittle,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500, color: Colors.white)
          ),

        ),
        const SizedBox(height: 16,),
        Text(discription,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize:20,height:2,fontWeight: FontWeight.w700, color: Colors.white),
          ),
        const Spacer(),
      ],
    );
  }
}
