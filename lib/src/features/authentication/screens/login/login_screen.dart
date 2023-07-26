import 'package:fit_lab/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_hearder_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // get fEmail => null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSize.fDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // section-1 ---image and text i.e., header
                LoginHeaderWidget(size: size),


                // section-2 --- loginForm
                const LoginForm(),

                // section-3 --- SignUpwithGoogle
                const LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

