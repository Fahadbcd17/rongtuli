import 'package:rong_tuli/consts/consts.dart';

Widget sharedButton({
  Color? color, 
  String? title, 
  Color? textColor,
  VoidCallback? onPress,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(12),
      backgroundColor: color ?? redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    onPressed: onPress,
    child: title?.text.color(textColor).fontFamily(bold).make() ?? const SizedBox(),
  );
}