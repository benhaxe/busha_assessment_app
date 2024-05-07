import 'dart:async';

import 'package:busha_app/app/auth/presentation/logic/auth_logic.dart';
import 'package:busha_app/app/home/presentation/app_home.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:busha_app/views/components/buttons/app_buttons.dart';
import 'package:busha_app/views/forms/app_text_field.dart';
import 'package:busha_app/views/forms/validators/form_field_validators.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Keys.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Key emailKey = UniqueKey();
  final Key passwordKey = UniqueKey();

  //Controllers
  late final TextEditingController emailCtrl;
  late final TextEditingController passwordCtrl;
  late ValueNotifier<bool> isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = ValueNotifier(false);

    emailCtrl = TextEditingController(text: '');
    passwordCtrl = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: const KAppBar(),
      body: SingleChildScrollView(
        padding: context.insetsAll(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in to your account',
                style: context.textTheme.titleLarge!,
              ),
              const YMargin(8),
              Text(
                'Welcome back! Please enter your registered email address to continue',
                style: context.textTheme.bodyMedium!,
              ),
              const YMargin(8),
              AppTextField(
                key: emailKey,
                controller: emailCtrl,
                label: 'Email address',
                hint: 'hello@bush.co',
                onChanged: (value) => emailCtrl.text = value,
                validator: (value) =>
                    AppFormFielValidator.emailValidator(value),
              ),
              AppTextField(
                key: passwordKey,
                controller: passwordCtrl,
                label: 'Password',
                hint: 'Enter Password',
                onChanged: (value) => passwordCtrl.text = value,
                validator: (value) =>
                    AppFormFielValidator.passwordValidator(value),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: context.insetsAll(16.0).copyWith(bottom: 40),
        child: ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (_, bool isButtonLoading, __) {
              return AppButton(
                label: 'Continue',
                isLoading: isButtonLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //Assume that the email & password will have to be valid before the button is active
                    //So we just validate the content of the passowrd, if it is 'busha'.
                    final isPasswordValid =
                        AuthLogic().validatePassword(passwordCtrl.text);

                    //If password is not valid.
                    if (!isPasswordValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Invalid Password: Password can be busha in any order',
                          ),
                        ),
                      );
                      return;
                    }
                    isLoading.value = true;
                    Future.delayed(const Duration(seconds: 4), () {
                      isLoading.value = false;

                      //Navigate to home screen.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const AppHome();
                          },
                        ),
                      );
                    });
                  }
                },
              );
            }),
      ),
    );
  }
}
