import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postcodeController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var paymentIndex = 0.obs;

  calculate(data){
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
      
    }
  }

  changePaymentIndex (index) {
    paymentIndex.value = index;
  }
}