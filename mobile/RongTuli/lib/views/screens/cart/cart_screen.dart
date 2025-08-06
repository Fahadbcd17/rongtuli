import 'package:rong_tuli/consts/consts.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart".text.color(darkFontGrey)
        .fontFamily(semibold)
        .make(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
                "40".numCurrency.text.fontFamily(semibold).color(redColor).make()
              ],
            ).box.padding(EdgeInsets.all(12)).color(lightGolden).roundedSM.make(),
          ],
        ),
      ),
    );
  }
}
