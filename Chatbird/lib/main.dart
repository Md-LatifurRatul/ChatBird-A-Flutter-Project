import 'package:camera/camera.dart';
import 'package:chatbird/Pages/signup_pages.dart';
import 'package:chatbird/Screens/camera_screen.dart';
import 'package:chatbird/Screens/login_screen.dart';
import 'package:chatbird/Services/Auth_Service.dart';
//import 'package:chatbird/NewScreen/landing_screen.dart';
//import 'package:chatbird/NewScreen/login_page.dart';
//import 'package:chatbird/NewScreen/landing_screen.dart';
//import 'package:chatbird/NewScreen/login_page.dart';
//import 'package:chatbird/Screens/camera_screen.dart';
//import 'package:chatbird/Screens/login_screen.dart';
//import 'package:chatbird/Screens/login_screen.dart';
//import 'package:chatbird/Screens/home_screen.dart';
//import 'package:chatbird/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await authClass.getToken();
    if (token != null) {
      setState(() {
        currentPage = LoginScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.red,
        ),
      ),

      home: currentPage,

      // home: const LandingScreen(),

      // home: LoginScreen(), // The main page of the project
    );
  }
}  //My code ends here





// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

//   void signup() async {
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(
//           email: "Ratul6@gmail.com", password: "1234567");
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Firebase"),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               signup();
//             },
//             child: Text("Signup"),
//           ),
//         ),
//       ),
//     );
//   }
// }
