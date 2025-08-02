import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/model/category_medl.dart';

class FirestoreServices {
  static getUser(uid){
    return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }

  static getProducts(Category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: Category).snapshots();
  }
}