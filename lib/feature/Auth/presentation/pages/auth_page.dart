// Import necessary packages and files
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/image/image_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/text_style_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_page_bloc/auth_page_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/widget/square_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';

// Annotate the class with @RoutePage for auto-routing
@RoutePage()
class AuthPageView extends StatefulWidget {
  const AuthPageView({Key? key}) : super(key: key);

  @override
  AuthPageViewState createState() => AuthPageViewState();
}

class AuthPageViewState extends State<AuthPageView> {
  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    final isDark = context.isDarkMode;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSvgImage(),
            const SizedBox(height: 20),
            _buildEmailTextField(),
            const SizedBox(height: 20),
            _buildPasswordTextField(),
            const SizedBox(height: Material3Design.mediumPadding),
            _buildForgotPasswordText(),
            const SizedBox(height: Material3Design.mediumPadding),
            _buildSignInButton(),
            _buildDivider(),
            _buildSocialMediaButtons(isDark),
            const SizedBox(height: Material3Design.largePadding),
            _buildRegisterText(),
          ]
        ).paddedAll(Material3Design.largePagePadding).padded(
          EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
      ),
    );
  }

  /// Widget function to build the SVG image
  Widget _buildSvgImage() {
    return SvgPicture.asset(
      SVGConstants.login,
      height: MediaQuery.of(context).size.width / 1.7,
    );
  }

  /// Widget function to build the email text field
  Widget _buildEmailTextField() {
    return TextFormField(
      onChanged: (value) {
        context.read<AuthPageBloc>().add(AuthPageEmailChanged(email: value));
      },
      decoration:  InputDecoration(
        labelText: "email".tr(),
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(),
      ),
    );
  }

  /// Widget function to build the password text field
  Widget _buildPasswordTextField() {
    return BlocBuilder<AuthPageBloc, AuthPageBlocState>(
      buildWhen: (previous, current) =>
          previous.passwordIsObscure != current.passwordIsObscure,
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) {
            context
                .read<AuthPageBloc>()
                .add(AuthPagePasswordChanged(password: value));
          },
          obscureText: state.passwordIsObscure,
          decoration: InputDecoration(
            labelText: "password".tr(),
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () {
                context.read<AuthPageBloc>().add(
                    AuthPagePasswordObscureChanged(
                        passwordIsObscure: !state.passwordIsObscure));
              },
              icon: Icon(
                state.passwordIsObscure
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          ),
        );
      },
    );
  }

  /// Widget function to build the "Forgot Password?" text
  Widget _buildForgotPasswordText() {
    return Text(
      "forgotpassword".tr(),
      style: AppTextStyle.MINI_BOLD_DESCRIPTION_TEXT,
    );
  }

  /// Widget function to build the "Sign in" button
  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthPageBloc>().add(const AuthPageSubmitted());
        },
        child:  Text("signin".tr()),
      ),
    );
  }

  /// Widget function to build the divider
  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 50,
            thickness: 0.5,
            color: Colors.grey[400],
          ),
        ),
         Text(
          "orContinueWith".tr(),
          style: AppTextStyle.MINI_DESCRIPTION_TEXT,
        ).paddedSymmetric(horizontal: 10),
        Expanded(
          child: Divider(
            endIndent: 50,
            thickness: 0.5,
            color: Colors.grey[400],
          ),
        ),
      ],
    ).paddedSymmetric(vertical: Material3Design.smallPadding);
  }

  /// Widget function to build the social media buttons
  Widget _buildSocialMediaButtons(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareBox(
          imagePath: ImageConstants.google,
          color: isDark ? Colors.white12 : Colors.black12,
          onTap: () {
            context.read<AuthPageBloc>().signInWithGoogle();
          },
        ),
        const SizedBox(width: 25),
        SquareBox(
          imagePath: ImageConstants.apple,
          imageColor:isDark ? Colors.white : null,
          color: isDark ? Colors.white12 : Colors.black12,
          onTap: () {},
        ),
      ],
    );
  }

  /// Widget function to build the "Not a member?" and "Register Now" text
  Widget _buildRegisterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "notamember".tr(),
          style: AppTextStyle.MINI_DEFAULT_DESCRIPTION_TEXT,
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(const AuthRegisterPageRoute());
          },
          child: Text(
            "registernow".tr(),
            style: AppTextStyle.MINI_DESCRIPTION_TEXT,
          ),
        ),
      ],
    );
  }
}
