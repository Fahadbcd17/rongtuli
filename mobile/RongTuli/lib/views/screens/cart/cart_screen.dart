import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/services/firestore_services.dart';
import 'package:rong_tuli/widgets/Shared/loading_indicator.dart';
import 'package:rong_tuli/widgets/Shared/shared_button.dart';


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

      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid), 
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
          if (!snapshots.hasData){
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshots.data!.docs.isEmpty){
            return Center(
              child: "Cart is empty".text.color(darkFontGrey).make(),
            );
          } else {

            var data = snapshots.data!.docs;

            return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Image.network("${data[index]['img']}"),
                    title: "${data [index]['title']}"
                    .text.fontFamily(semibold)
                    .size(16).make(),
                    subtitle: "${data[index]['tprice']}".numCurrency
                    .text.color(redColor)
                    .fontFamily(semibold).make(),
                    trailing: const Icon(Icons.delete,
                    color: redColor)
                    .onTap((){}),
                    );
                },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Total price".text.fontFamily(semibold).color(darkFontGrey).make(),
                "40".numCurrency.text.fontFamily(semibold).color(redColor).make()
              ],
            ).box.padding( const EdgeInsets.all(12))
            .width(context.screenWidth - 60)
            .color(lightGolden).roundedSM.make(),

            10.heightBox,

            SizedBox(
              width: context.screenWidth - 60,
              child: sharedButton(
                color: redColor,
                onPress: (){},
                textColor: whiteColor,
                title: "Order Now"
              )),
          ],
        ),
      );
          }
        })
    );
  }
}
