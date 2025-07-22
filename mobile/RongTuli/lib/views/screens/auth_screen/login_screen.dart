import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/list.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';
import 'package:rong_tuli/widgets/Shared/logo.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';
import 'package:rong_tuli/widgets/Shared/text_field.dart';
import 'package:rong_tuli/views/screens/auth_screen/signup_screen.dart';
import 'package:rong_tuli/views/screens/home/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child:Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight* 0.1).heightBox,
            logoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,

            Column(
              children: [
              textField(hint: emailHint, title: email),
               textField(hint: passwordHint, title: password),
               Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: forgetPass.text.make())),
                5.heightBox,
                sharedButton(color: redColor, title: login, textColor: whiteColor, onPress: () {
                  Get.to(() => const Home());
                })
                .box
                .width(context.screenWidth -50)
                .make(),

                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
              sharedButton(color: lightGolden, title: signup, textColor: redColor, onPress: () {
                Get.to(() => const SignupScreen());
              })
                .box
                .width(context.screenWidth -50)
                .make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 25,
                      child: Image.asset(socialIconList[index], width: 30,),
                    ),
                  )),
                )

              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.make(),
          ],
        ),
      ),
    ));
  }
}