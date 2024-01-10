import 'package:get/get.dart';

class ImageVaultController extends GetxController{
  RxBool isLoader = false.obs;
  RxString videoThum = "".obs;
  RxList imageList = [].obs;
  RxList videoList = [].obs;
  RxList thumList = [].obs;
  RxBool thumLoader = false.obs;
}