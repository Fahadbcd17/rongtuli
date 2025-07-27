import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/controllers/profile_controller.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';
import 'package:rong_tuli/widgets/Shared/text_field.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.passController.text = data['password'];
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(()=>
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make():Image.file(File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                          ).box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make(),
                          10.heightBox,
                          sharedButton(color: redColor, onPress: (){
                            controller.changeImage(context);
                          }, textColor: whiteColor, title: "Change"),
                          const Divider(),
                          20.heightBox,
                          textField(hint: nameHint,title: name,isPass: false, controller: controller.nameController),
                          textField(hint: passwordHint,title: password,isPass: true, controller: controller.passController),
                          20.heightBox,
                          SizedBox(
                            width: context.screenWidth -60,
                            child: sharedButton(color: redColor, onPress: (){}, textColor: whiteColor, title: "Save")),
            ],
          ).box.shadowSm.white.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
        ),
      ));
  }
}