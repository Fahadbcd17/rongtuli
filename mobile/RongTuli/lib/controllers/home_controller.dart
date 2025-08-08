import 'package:get/get.dart';
import 'package:rong_tuli/consts/firebase_consts.dart';

class HomeController extends GetxController{
  var currentNavIndex = 0.obs;
  
  var username = '';
  getUsername() async {
    await firestore.collection(userCollection).where('id', isEqualTo: currentUser!.uid).get().then((value){
      if (value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    });
  }
}