import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:say_hi/feauters/auth/controller/auth_controller.dart';
import 'package:say_hi/firebase_options.dart';
import 'package:say_hi/router.dart';
import 'package:say_hi/utility/common/colors.dart';
import 'package:say_hi/feauters/landing/landing_page.dart';
import 'package:say_hi/screens/home_screen.dart';
import 'package:say_hi/utility/widgets/error.dart';
import 'package:say_hi/utility/widgets/loader.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SayHi!',
      theme: ThemeData(primaryColor: backgroundColormain),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
            data: (user) {
              if (user == null) {
                return const LandingPage();
              }
              return const HomeScreen();
            },
            error: (err, trace) {
              return ErrorScreen(error: err.toString());
            },
            loading: () => const Loader(),
          ),
    );
  }
}
