import 'package:flutter/material.dart';
import 'package:smartscape/src/common/widgets/login_divider.dart';
import 'package:smartscape/src/common/widgets/login_footer.dart';
import 'package:smartscape/src/features/authentication/screens/signup/widget/terms_and_conditions_checkbox.dart';
import 'package:smartscape/src/features/authentication/screens/signup/widget/signup_form.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/constants/text_strings.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title or Header
              Text(
                Ttext.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              const TSignUpForm(),

              //checkbox
              const TSignUpCheckbox(),

              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              //Create Account Button
              

              //Divider
              const TFormDivider(dividerText: Ttext.orSignInWith),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              //Footer
              const TLoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
