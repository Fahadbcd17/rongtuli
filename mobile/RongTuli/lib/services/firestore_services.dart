import 'package:rong_tuli/consts/consts.dart';
import 'package:rong_tuli/model/category_medl.dart';

class FirestoreServices {
  static getUser(uid){
    return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }

  static getProducts(Category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: Category).snapshots();
  }

  static getCart (uid){
    return firestore
    .collection(cartCollection)
    .where('added_by', isEqualTo: uid)
    .snapshots();
  }

  static deleteItem(itemId){
    return firestore.collection(cartCollection).doc(itemId).delete();
  }
}