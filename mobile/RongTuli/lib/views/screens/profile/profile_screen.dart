import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/list.dart';
import 'package:rong_tuli/views/screens/profile/details_cart.dart';
import 'package:rong_tuli/widgets/Shared/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: whiteColor)).onTap((){ }),
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
                            "user1".text.fontFamily(semibold).white.make(),
                            "example@example.com".text.white.make(),
                          ],
                        )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                      onPressed: () {},
                      child: logout.text.fontFamily(semibold).white.make(),
                    ),
                  ],
                ),
              ),
              20.heightBox,
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 detailsCart(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                 detailsCart(count: "44", title: "in your wishlist", width: context.screenWidth / 3.4),
                 detailsCart(count: "5763", title: "your orders", width: context.screenWidth / 3.4),
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
          ),
        ),
      ),
    );
  }
}