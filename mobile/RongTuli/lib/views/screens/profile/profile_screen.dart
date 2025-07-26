import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/list.dart';
import 'package:rong_tuli/controllers/auth_controller.dart';
import 'package:rong_tuli/controllers/profile_controller.dart';
import 'package:rong_tuli/services/firestore_services.dart';
import 'package:rong_tuli/views/screens/auth_screen/login_screen.dart';
import 'package:rong_tuli/views/screens/profile/details_cart.dart';
import 'package:rong_tuli/views/screens/profile/edit_profile_screen.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        body:StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid), 
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
            if(!snapshots.hasData){
              return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),
              ),
              );
            } else {
              var data = snapshots.data!.docs[0];
              return  SafeArea(
          child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: whiteColor)).onTap((){
                Get.to(()=> EditProfileScreen( 
                  data: data
                  ));
               }),
             ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}".text.fontFamily(semibold).white.make(),
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).white.make(),
                    ),
                  ],
                ),
              ),
              20.heightBox,
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 detailsCart(count: data['cart_count'], title: "in your cart", width: context.screenWidth / 3.4),
                 detailsCart(count: data['wishlist_count'], title: "your wishlist", width: context.screenWidth / 3.4),
                 detailsCart(count: data['order_count'],title: "your orders", width: context.screenWidth / 3.4),
               ],
             ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index){
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Image.asset(profileButtonIcon[index], width: 22),
                    title: profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                  },
                  ).box.rounded.white.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
            ],
          ));
            }
            
          },
          ),
      ),
    );
  }
}