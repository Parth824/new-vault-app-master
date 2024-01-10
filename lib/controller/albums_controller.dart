import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class AlbumsController extends GetxController {
  RxList<Album> imageAlbums = <Album>[].obs;
  RxBool isLoader = false.obs;
  
  RxList<Medium> media = <Medium>[].obs;
  RxBool isLoaderAlbumList = false.obs;
}