import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';
import 'package:rong_tuli/widgets/Shared/text_field.dart';


class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
      
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: sharedButton(
          onPress: (){},
          color: redColor,
          textColor: whiteColor,
          title: "Continue" 
        ),
      ),
      body: Column(
        children: [
          textField(hint: "Country", isPass: false,title: "Country"),
          textField(hint: "City", isPass: false, title: "City"),
          textField(hint: "State", isPass: false,title: "State"),
          textField(hint: "Post Code", isPass: false,title: "Post Code"),
          textField(hint: "Address", isPass: false,title: "Address"),
          textField(hint: "Phone", isPass: false, title: "Phone"),
        ],
      ),
    );
  }
}