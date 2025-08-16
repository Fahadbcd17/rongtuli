import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/controllers/cart_controller.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';
import 'package:rong_tuli/widgets/Shared/text_field.dart';


class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
      
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: sharedButton(
          onPress: (){
            if (controller.addressController.text.length > 10) {
              VxToast.show(context, msg: "Please fill the form right way");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue" 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            textField(hint: "Country", isPass: false,title: "Country", 
            controller: controller.countryController),
            textField(hint: "City", isPass: false, title: "City", 
            controller: controller.cityController),
            textField(hint: "State", isPass: false,title: "State", 
            controller: controller.stateController),
            textField(hint: "Post Code", isPass: false,title: "Post Code", 
            controller: controller.postcodeController),
            textField(hint: "Address", isPass: false,title: "Address", 
            controller: controller.addressController),
            textField(hint: "Phone", isPass: false, title: "Phone", 
            controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}