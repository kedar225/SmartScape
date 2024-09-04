import 'package:flutter/material.dart';
import 'package:smartscape/src/common/widgets/login_divider.dart';
import 'package:smartscape/src/common/widgets/login_footer.dart';
import 'package:smartscape/src/features/authentication/screens/login/widgets/login_form.dart';
import 'package:smartscape/src/features/authentication/screens/login/widgets/login_header.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              ///Header
              TLoginHeader(),

              ///Form
              TLoginForm(),

              ///Divider
              TFormDivider(dividerText: Ttext.orSignInWith),

              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              //Footer
              TLoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
