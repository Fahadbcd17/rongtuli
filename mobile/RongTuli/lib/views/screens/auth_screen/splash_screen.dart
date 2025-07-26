import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/views/screens/auth_screen/login_screen.dart';
import 'package:rong_tuli/views/screens/home/home_screen.dart';
import 'package:rong_tuli/widgets/Shared/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds: 3), (){
      // Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to (() => const LoginScreen());
        } else {
          Get.to(() => const HomeScreen());
        }
      });
    });
  }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
           Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
           20.heightBox,
           logoWidget(),
           10.heightBox,
           appname.text.fontFamily(bold).size(22).white.make(),
           5.heightBox,
           appversion.text.white.make(),
          ],
        ),
      ),
    );
  }
}