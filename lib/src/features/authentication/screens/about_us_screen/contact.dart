import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
// See installation notes below regarding AndroidManifest.xml and Info.plist

// import 'package:sky_engine/_http/http.dart' as http;

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    );
  }
}
// final nameController = TextEditingController();
// final subjectController= TextEditingController();
// final emailController = TextEditingController();
// final messageController = TextEditingController();

// Future sendEmail() async{
//   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
//   final response = await http.(url,
//     headers:
//   );

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

//   Future sendEmail({
//   required String name;
//   required String email;
//   required String subject;
//   required String message;
//
// })async{
//
//   }
//   final controllerTo = TextEditingController();
//   final controllerSubject = TextEditingController();
//   final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.5),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: CircleAvatar(
            backgroundColor: Colors.red.withOpacity(0.7),
            child: const Icon(
              LineAwesomeIcons.angle_left,
              size: 25,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,

            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(fbackgroundImage),
              )),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    const Text('\n'),
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
                        ' Contact Us ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 60),
                      ),
                    ),
                    //Extra statement
                    const Text('\n\n\n'),
                    const Text(
                      '  Having any queries?  \n',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                    const Text('\n', style: TextStyle(fontSize: 5)),
                    const Text(
                      '  Send a mail :   ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                    const Text('\n', style: TextStyle(fontSize: 5)),
                    const Text(
                      '  FitLabConsulting@gmail.com  ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                    const Text('\n'),
                    const Text('\n', style: TextStyle(fontSize: 5)),
                    const Text(
                      ' Contact via Mobile :',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                    const Text('\n', style: TextStyle(fontSize: 5)),
                    const Text(
                      '   ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                    const Text('\n'),
          
                    //juz for some gap between the items
          
                    //buildTextField(tittle : 'To'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
//   Widget buildTextField({
//   required String tittle,
//     required TextEditingController controller,
// }) =>
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '',
//
//           ),
//           const SizedBox(height :8),
//           TextField(
//             controller: controller,
//             decoration: const InputDecoration(
//               border: OutlinedBorder(),
//             ),
//           )
//
//
//         ],
//       );
}
