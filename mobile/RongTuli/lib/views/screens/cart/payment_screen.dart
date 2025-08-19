import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/list.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: redColor,
                  width: 5
                )

              ),
              margin: const EdgeInsets.only(bottom: 8),
              child: Stack(
                alignment: Alignment.topRight,
                children:[ Image.asset(paymentMethodsImg[index], 
                width: double.infinity, 
                height: 100,fit: BoxFit.cover),
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    value: true, onChanged: (value){}
                    ),
                )
                ]
              ),
            );
          }),
        ),
      ),
    );
  }
}