import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/consts/firebase_consts.dart';

class AuthController extends GetxController {

  Future<UserCredential?> loginMethod({email, password, context}) async{
    UserCredential userCredential;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}