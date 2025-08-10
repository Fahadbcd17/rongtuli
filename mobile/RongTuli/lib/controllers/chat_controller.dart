import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rong_tuli/consts/firebase_consts.dart';
import 'package:rong_tuli/controllers/home_controller.dart';

class ChatController extends GetxController {

var chats = firestore.collection(chatsCollection);


var friendName = Get.arguments[0];
var friendId = Get.arguments[1];

var senderName = Get.find<HomeController>().username;
var currentId = currentUser!.uid;

var msgController = TextEditingController();

dynamic chatDocId;
}