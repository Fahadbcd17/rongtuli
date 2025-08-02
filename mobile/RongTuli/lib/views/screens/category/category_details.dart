import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rong_tuli/controllers/product_controler.dart';
import 'package:rong_tuli/services/firestore_services.dart';
import 'package:rong_tuli/views/screens/category/item_details.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/widgets/Shared/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductControler>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
            if(!snapshots.hasData){
              return Center(
                child: loadingIndicator(),
              );
           } else if (snapshots.data!.docs.isEmpty){
            return Center(
              child: "No products found!".text.color(darkFontGrey).make(),
            );
           } else {
            return Container(
          padding:const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.subcat.length,
                   (index) => "${controller.subcat[index]}".text.size(12)
                      .fontFamily(semibold).color(darkFontGrey).makeCentered().box.rounded.white.size(120, 60)
                      .margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                ),
              ),
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                    physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent:250, mainAxisSpacing: 8,crossAxisSpacing: 8),
                  itemBuilder: (context,index){
                   return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(imgP5, height: 150, width: 200, fit: BoxFit.cover),
                        const Spacer(),
                        "Laptop 8GB/512GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "\$200".text.color(redColor).fontFamily(bold).size(16).make(),
                      ],
                    ).box.white.roundedSM.margin(const EdgeInsets.symmetric(horizontal: 4)).outerShadowSm.padding(const EdgeInsets.all(8)).make().onTap((){
                      Get.to(() => const ItemDetails(title: "item"));
                   });
                  }))
          ],
        ),
        );
           }
           }
           ),
      ));
  }
}