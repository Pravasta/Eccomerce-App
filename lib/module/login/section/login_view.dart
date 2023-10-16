import 'package:ecommerce_app/config/routes/route_name.dart';
import 'package:ecommerce_app/widgets/button/default_button.dart';
import 'package:ecommerce_app/widgets/field/detault_text_field.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/url_assets.dart';
import '../../../style/colors.dart';
import '../../../style/text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        padding: const EdgeInsets.only(top: 33),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: AppColors.lightGrey,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _header(),
              _textFieldSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleTextField(String text) => Text(
        text,
        style: AppTextStyle.textLarge.copyWith(
          fontWeight: AppTextWeight.extraBold,
        ),
      );

  Widget _header() {
    return Column(
      children: [
        Image.asset(
          UrlAsset.logo2,
          width: 74,
          height: 100,
        ),
        const SizedBox(height: 25),
        Text(
          'Welcome Back',
          style: AppTextStyle.textTripleExtraLarge.copyWith(
            fontWeight: AppTextWeight.semiBold,
          ),
        ),
        Text(
          'Please enter your email and Password',
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.lightGrey,
            fontWeight: AppTextWeight.medium,
          ),
        ),
      ],
    );
  }

  Widget _textFieldSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 55),
          _titleTextField('Email Address'),
          const SizedBox(height: 10),
          DefaultTextField(
            initialText: 'yyyy',
            hintText: 'Enter your Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email tidak boleh kosong";
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          _titleTextField('Password'),
          const SizedBox(height: 10),
          DefaultTextField(
            initialText: 'aaaa',
            hintText: 'Enter your Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password tidak boleh kosong";
              }
              return null;
            },
            isObscure: isObscure,
            suffixWidget: IconButton(
              iconSize: 20,
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: isObscure
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                    ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forgot Password ? ',
                style: AppTextStyle.textMedium.copyWith(
                  color: AppColors.lightGrey,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'here',
                  style: AppTextStyle.textMedium.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                activeColor: AppColors.primaryColor,
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
              Text(
                'Remember me',
                style: AppTextStyle.textMedium.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          _buttonSection(),
        ],
      ),
    );
  }

  Widget _buttonSection() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          DefaultButton(
            text: "Login",
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.dashboard, (route) => false);
            },
          ),
          const SizedBox(height: 18),
          _dontHaveAccount(() {}),
        ],
      ),
    );
  }

  Widget _dontHaveAccount(VoidCallback? onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account yet ? ',
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.lightGrey,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'Sign Up',
            style: AppTextStyle.textMedium.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
