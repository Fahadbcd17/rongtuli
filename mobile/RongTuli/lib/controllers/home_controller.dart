import 'package:get/get.dart';
import 'package:rong_tuli/consts/firebase_consts.dart';

class HomeController extends GetxController{
  var currentNavIndex = 0.obs;

  @override
  void onInit() {

    // TODO: implement onInit
    getUsername();
    super.onInit();
  }
  
  var username = '';
  getUsername() async {
   var n = await firestore.collection(userCollection).where('id', isEqualTo: currentUser!.uid).get().then((value){
      if (value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    });

    username = n;
  }
}