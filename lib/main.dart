import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shopping/SplachScreen.dart';
import 'package:online_shopping/bloc/cubitProfile/CubitProfile.dart';
import 'package:online_shopping/bloc/cubit_signIn/cubit_signin.dart';
import 'package:online_shopping/bloc/cubit_signup/cubit_signup.dart';
import 'package:online_shopping/firebase/auth.dart';
import 'package:online_shopping/screens/HomeScreen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiRepositoryProvider(
        providers: [
          BlocProvider(create: (context) => CubitSignup()),
          BlocProvider(create: (context) => CubitProfile()),
          BlocProvider(create: (context) => CubitSignin()),
        ],
        child: MaterialApp(
          home: Authen.auth.currentUser == null ? splashScreen() : Homescreen(),
        ),
      ),
    );
  }
}
