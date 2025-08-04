import 'package:rong_tuli/consts/consts.dart';

Widget exitDialog () {
  return Dialog(
    child: Column(
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.size(16).color(darkFontGrey).make(),
      ],
    ).box
    .color(lightGrey).roundedSM.make(),
  );
}

