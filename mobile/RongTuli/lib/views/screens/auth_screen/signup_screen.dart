import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';
import 'package:rong_tuli/widgets/Shared/logo.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';
import 'package:rong_tuli/widgets/Shared/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
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
                "Join the $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,

                Column(
                  children: [
                    textField(hint: nameHint, title: name),
                    textField(hint: emailHint, title: email),
                    textField(hint: passwordHint, title: password),
                    textField(hint: passwordHint, title: retypePassword),
                    10.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          checkColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                            }
                        ),
                        10.widthBox,
                        Expanded(
                          child: RichText(text: const TextSpan(
                            children: [
                              TextSpan( text: "I agree to the ", style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                              TextSpan( text: termAndCond,
                                  style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                              TextSpan( text: "&", style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                              TextSpan( text: privacyPolicy, style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              ))
                            ],
                          )),
                        ),
                      ],
                    ),
                    5.heightBox,
                    sharedButton(color: isCheck == true? redColor : lightGrey, title: signup, textColor: whiteColor, onPress: () {})
                        .box
                        .width(context.screenWidth -50)
                        .make(),
                    10.heightBox,
                    RichText(text:const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey
                          )),
                        TextSpan(
                            text: login,
                            style: TextStyle(
                                fontFamily: bold,
                                color: redColor
                            )),
                      ]
                    ),
                    ).onTap(() {
                      Get.back();
                    }),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.make(),
              ],
            ),
          ),
        ));
  }
}
