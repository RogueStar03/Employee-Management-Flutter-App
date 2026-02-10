import 'package:ams_android/blocs/login/login_bloc.dart';
import 'package:ams_android/constants.dart';
import 'package:ams_android/widgets/custom_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_button/sign_in_button.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions for responsive adjustments
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, 'dashboardScreen');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // Responsive horizontal padding
                vertical: screenHeight * 0.1, // Responsive vertical padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcomeText(screenHeight),
                  SizedBox(height: screenHeight * 0.04), // Responsive spacing
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
                      if (!RegExp(emailPattern).hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  _buildForgotPasswordButton(),
                  _buildLoginButton(screenHeight, orientation),
                  SizedBox(height: screenHeight * 0.04),
                  _buildDivider(),
                  SizedBox(height: screenHeight * 0.03),
                  _buildGoogleLoginButton(screenHeight, orientation),
                  SizedBox(height: screenHeight * 0.02),
                  _buildRegisterRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Welcome Text Widget with responsive font sizes
  Widget _buildWelcomeText(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back 👋🏻',
          style: kRegularTitleStyle.copyWith(
            fontSize: screenHeight * 0.04, // Adjust font size dynamically
            height: 0.8,
          ),
        ),
        const Text('to EMS', style: kRegularTitleStyle),
        Text(
          'Hello there, please login to continue',
          style: kThinLabelStyle.copyWith(
            fontSize: screenHeight * 0.02, // Adjust font size
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // Forgot Password Button
  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: _transparentButtonStyle(),
          onPressed: () {
            // Handle forgot password action
          },
          child: Text(
            'Forgot Password',
            style: kRegularLabelStyle.copyWith(fontWeight: FontWeight.w700, color: Colors.teal),
          ),
        ),
      ],
    );
  }

  // Login Button with dynamic width
  Widget _buildLoginButton(double screenHeight, Orientation orientation) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return SizedBox(
          width: double.infinity,
          height: orientation == Orientation.portrait ? screenHeight * 0.06 : screenHeight * 0.12,
          child: TextButton(
            style: kRoundedRectangleButton.copyWith(
              backgroundColor: WidgetStatePropertyAll(Colors.teal.shade700),
              foregroundColor: WidgetStatePropertyAll(Colors.teal.shade50),
            ),
            onPressed: isLoading
                ? null
                : () {
                    context.read<LoginBloc>().add(
                      LoginSubmitted(_emailController.text, _passwordController.text),
                    );
                  },
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Login', textAlign: TextAlign.center, style: kRegularLabelStyle),
          ),
        );
      },
    );
  }

  // Divider with Text
  Widget _buildDivider() {
    return Row(
      children: <Widget>[
        const Expanded(child: Divider()),
        Text("   Or Use Google Login   ", style: kThinLabelStyle.copyWith(color: Colors.black54)),
        const Expanded(child: Divider()),
      ],
    );
  }

  // Google Login Button with dynamic height
  Widget _buildGoogleLoginButton(double screenHeight, Orientation orientation) {
    return SizedBox(
      width: double.infinity,
      height: orientation == Orientation.portrait ? screenHeight * 0.06 : screenHeight * 0.12,
      child: SignInButton(
        Buttons.google,
        onPressed: () {
          // Handle Google login action
        },
      ),
    );
  }

  // Register Text Button Row
  Widget _buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Didn\'t have an account?', style: kThinLabelStyle.copyWith(color: Colors.black54)),
        TextButton(
          style: _transparentButtonStyle(),
          onPressed: () {
            // Handle register action
          },
          child: Text(
            'Register',
            style: kRegularLabelStyle.copyWith(fontWeight: FontWeight.w700, color: Colors.teal),
          ),
        ),
      ],
    );
  }

  // Transparent Button Style (Reusable for Forgot Password and Register)
  ButtonStyle _transparentButtonStyle() {
    return const ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.transparent));
  }
}
