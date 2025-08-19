import 'package:rong_tuli/consts/consts.dart';
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
    );
  }
}