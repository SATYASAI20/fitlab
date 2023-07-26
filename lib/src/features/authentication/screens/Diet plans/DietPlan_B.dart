// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DietplanB extends StatelessWidget {
  const DietplanB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PlanB(),
    );
  }
}

class PlanB extends StatefulWidget {
  const PlanB({Key? key}) : super(key: key);

  @override
  State<PlanB> createState() => _NutritionStateB();
}

class _NutritionStateB extends State<PlanB> {
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
        backgroundColor: Colors.blue.withOpacity(0.8),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:  const CircleAvatar(
            child:  Icon(
              LineAwesomeIcons.angle_left,
              size: 25,  
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bgdiet.jpg'),
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
    image: 'assets/images/TipsPics/early.jpg',
    title: 'Early Morning',
    discription: '1.Hot water with lemon and honey\n2.Lemon Tea\n3.Carrot/Beetroot Juice',
  ),
  OnBoard(
    image: 'assets/images/TipsPics/breakfast.jpg',
    title: 'Breakfast',
    discription: '1.Oats in milk\n2.Mixed nuts and egg whites\n3.Sprouts\n4.Sandwich',
  ),
  OnBoard(
    image: 'assets/images/TipsPics/lunch.jpg',
    title: 'Lunch',
    discription: '1.Panner, Roti with dal\n2.Vegetable curry, Methi rice\n3.Items with chicken',
  ),
  OnBoard(
    image: 'assets/images/TipsPics/sancks.jpg',
    title: 'Snacks',
    discription: '1.Cup of fruits\n2.Butter milk\n3.Tea or Coffee',
  ),
  OnBoard(
    image: 'assets/images/TipsPics/dinner.jpg',
    title: 'Dinner',
    discription: '1.Mixed vegetable salad,  dal, roti\n2.Chole with steamed rice\n3.Curd, potato mixed vegetable curry with roti/rice',
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

            color: Colors.red.withOpacity(0.6),
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
