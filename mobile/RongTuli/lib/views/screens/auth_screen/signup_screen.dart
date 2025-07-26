import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/controllers/auth_controller.dart';
import 'package:rong_tuli/views/screens/home/home.dart';
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
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
    var emailController = TextEditingController();
      var passwordController = TextEditingController();
        var passwordRetypeController = TextEditingController();

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

                Obx(()=> Column(
                    children: [
                      textField(hint: nameHint, title: name, controller: nameController, isPass: false),
                      textField(hint: emailHint, title: email, controller: emailController, isPass: false),
                      textField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                      textField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
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
                     controller.isLoading.value? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                     ): sharedButton(color: isCheck == true? redColor : lightGrey, title: signup, textColor: whiteColor, onPress: ()async {
                        if (isCheck != false){
                          controller.isLoading(true);
                          try {
                            await controller.signupMethod(context: context, email: emailController.text, password : passwordController.text).then((Value){
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text
                              );
                            }).then ((value){
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            });
                          } catch (e) {
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                            controller.isLoading(false);
                          }
                        }
                      },
                      ).box
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
                ),
              ],
            ),
          ),
        ));
  }
}
