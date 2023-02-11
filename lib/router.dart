import 'package:flutter/material.dart';
import 'package:say_hi/feauters/auth/screens/login_screen.dart';
import 'package:say_hi/feauters/auth/screens/otp_screen.dart';
import 'package:say_hi/feauters/auth/screens/user_information.dart';
import 'package:say_hi/utility/widgets/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    case OTPScreen.routeName:
      final verificationIdn = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationIdn,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This Page Does not Exist'),
        ),
      );
  }
}
