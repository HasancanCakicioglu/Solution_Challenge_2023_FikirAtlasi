// Import statements
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Auth/presentation/bloc/auth_register_bloc/auth_register_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Annotate the class with @RoutePage for auto-routing
@RoutePage()
class AuthRegisterPageView extends StatefulWidget {
  const AuthRegisterPageView({super.key});

  @override
  State<AuthRegisterPageView> createState() => _AuthRegisterPageViewState();
}

// State class for AuthRegisterPageView
class _AuthRegisterPageViewState extends State<AuthRegisterPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // Provide AuthRegisterBloc to the widget tree
        create: (context) => sl.get<AuthRegisterBloc>(),
        child: Scaffold(
            appBar: AppBar(),
            body: Builder(builder: (BuildContext context) {

              return SingleChildScrollView(
                child: _buildContent(context),
              );
            })));
  }

  Widget _buildContent(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Form(
          child: Column(
            children: [
              _buildSvgImage(),
              const SizedBox(height: Material3Design.largePadding),
              _buildEmailTextField(context),
              const SizedBox(height: Material3Design.mediumPadding),
              _buildPasswordTextField(
                onChanged: (value) {
                  context
                      .read<AuthRegisterBloc>()
                      .add(AuthRegisterPasswordFirstChanged(value));
                },
                context: context,
              ),
              const SizedBox(height: Material3Design.mediumPadding),
              _buildPasswordTextField(
                onChanged: (value) {
                  context
                      .read<AuthRegisterBloc>()
                      .add(AuthRegisterPasswordSecondChanged(value));
                },
                context: context,
              ),
              const SizedBox(height: Material3Design.largePadding),
              _buildRegisterButton(context),
            ],
          ),
        ),
      ),
    ).paddedSymmetric(
      horizontal: Material3Design.largePagePadding,
    );
  }

  Widget _buildSvgImage() {
    return SvgPicture.asset(
      SVGConstants.register,
      height: MediaQuery.of(context).size.width / 1.7,
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        context.read<AuthRegisterBloc>().add(AuthRegisterEmailChanged(value));
      },
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordTextField({required ValueChanged<String> onChanged,required BuildContext context}) {
    return BlocBuilder<AuthRegisterBloc, AuthRegisterState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: onChanged,
          obscureText: !state.passwordIsObscure,
          decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: IconButton(
              onPressed: () {
                context.read<AuthRegisterBloc>().add(
                    AuthRegisterPasswordObscureChanged(
                        !state.passwordIsObscure));
              },
              icon: Icon(state.passwordIsObscure
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthRegisterBloc>().add(const AuthRegisterSubmitted());
        },
        child: const Text("Register"),
      ),
    );
  }
}
