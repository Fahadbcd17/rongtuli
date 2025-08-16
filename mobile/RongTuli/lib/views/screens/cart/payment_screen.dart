import 'package:rong_tuli/consts/consts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Payment Method".text
        .fontFamily(semibold).color(darkFontGrey)
        .make(),
      ),
    );
  }
}