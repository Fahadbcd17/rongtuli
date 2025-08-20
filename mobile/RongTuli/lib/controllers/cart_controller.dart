import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/controllers/home_controller.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postcodeController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var paymentIndex = 0.obs;
  late   dynamic productSnapshot;

  calculate(data){
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
      
    }
  }

  changePaymentIndex (index) {
    paymentIndex.value = index;
  }

  placeMyOrder({orderPaymentMethod, totalAmount}) async{
    await firestore.collection(ordersCollection).doc().set({
      "order_code" : "2556254326",
      "order_date" : FieldValue.serverTimestamp(),
      "order_by" : currentUser!.uid,
      "order_by_name" : Get.find<HomeController>().username,
      "order_by_email" : currentUser!.email,
      "order_by_address" : addressController.text,
      "order_by_state" : stateController.text,
      "order_by_city" : cityController.text,
      "order_by_phone" : phoneController.text,
      "order_by_postcode" : postcodeController.text,
      "shipping_method" : "Home Delivery",
      "payment_method" : orderPaymentMethod,
      "order_placed" : true,
      "total_amount" : totalAmount
    });
  }
}