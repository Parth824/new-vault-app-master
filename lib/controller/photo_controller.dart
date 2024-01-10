import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class PhotoController extends GetxController{
  RxList media = [].obs;
  RxList<Medium> temp = <Medium>[].obs;
  RxBool isLoader = false.obs;
}