import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/list.dart';
import 'package:rong_tuli/controllers/cart_controller.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CartController>();


    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar:  SizedBox(
        height: 60,
        child: sharedButton(
          onPress: (){},
          color: redColor,
          textColor: whiteColor,
          title: "Place Order" 
        ),
      ),
      appBar: AppBar(
        title: "Payment Method".text
        .fontFamily(semibold).color(darkFontGrey)
        .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(paymentMethodsImg.length, (index){
            return GestureDetector(
              onTap: () {
                
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    
                    color: controller.paymentIndex.value == index ? 
                     redColor : Colors.transparent,
                    width: 4
                  )
              
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: Stack(
                  alignment: Alignment.topRight,
                  children:[ Image.asset(paymentMethodsImg[index], 
                  width: double.infinity, 
                  height: 100,fit: BoxFit.cover),
                  controller.paymentIndex.value == index ?
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      value: true, onChanged: (value){}
                      ),
                  )
                  : Container(),
                  ]
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}