import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ImageViewController extends GetxController {
  RxList<Medium> imageList = <Medium>[].obs;
  RxInt currentIndex = 0.obs;
}