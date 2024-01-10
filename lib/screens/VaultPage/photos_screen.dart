import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/app_textstyle.dart';
import 'package:untitled/controller/photo_controller.dart';
import 'package:untitled/screens/VaultPage/image_view.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  PhotoController photoController = Get.put(PhotoController());

  @override
  void initState() {
    PhotoGallery.cleanCache();
    Future.microtask(() {
      getData();
    });
    super.initState();
  }

  void getData() async {
    photoController.isLoader.value = true;
    photoController.media.clear();
    List<Album> data =
        await PhotoGallery.listAlbums(mediumType: MediumType.image);
    MediaPage mediaPage = await data[0].listMedia();
    photoController.temp.value = mediaPage.items;
    List<Medium> temp = mediaPage.items;
    if (temp.isEmpty) {
      return;
    }
    DateTime? date = temp[0].creationDate;
    List dateViseData = [];
    for (int i = 0; i < temp.length; i++) {
      if (date.toString().substring(0, 11) !=
          temp[i].creationDate.toString().substring(0, 11)) {
        photoController.media.add({"date": date, "data": dateViseData});
        date = temp[i].creationDate;
        dateViseData = [];
        dateViseData.add(temp[i]);
      } else {
        dateViseData.add(temp[i]);
      }
    }
    photoController.media.add({"date": date, "data": dateViseData});
    photoController.isLoader.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => photoController.isLoader.value
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            )
          : photoController.media.isEmpty
              ? const Center(child: Text("Data not Found"))
              : RefreshIndicator(
                onRefresh: ()async{
                  getData();
                },
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: photoController.media.length,
                    itemBuilder: (context, index) {
                      String dateFormat = "";
                      if (photoController.media[index]['date']
                              .toString()
                              .substring(0, 11) ==
                          DateTime.now().toString().substring(0, 11)) {
                        dateFormat = "Today";
                      } else if (photoController.media[index]['date']
                              .toString()
                              .substring(0, 11) ==
                          DateTime(DateTime.now().year, DateTime.now().month,
                                  DateTime.now().day - 1)
                              .toString()
                              .substring(0, 11)) {
                        dateFormat = "Yesterday";
                      } else {
                        dateFormat = DateFormat(DateFormat.YEAR_MONTH_DAY).format(
                            DateTime.parse(
                                photoController.media[index]['date'].toString()));
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              dateFormat.toString(),
                              style: AppTextStyle.regularTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    photoController.media[index]['data'].length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (context, index2) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  ImageViewScreen(
                                                    imageList:
                                                        photoController.temp,
                                                    medium: photoController
                                                            .media[index]['data']
                                                        [index2],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: FadeInImage(
                                          image: ThumbnailProvider(
                                            mediumId: photoController
                                                .media[index]['data'][index2].id,
                                            mediumType: photoController
                                                .media[index]['data'][index2]
                                                .mediumType,
                                            highQuality: true,
                                          ),
                                          fit: BoxFit.fill,
                                          placeholder:
                                              MemoryImage(kTransparentImage),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }),
              ),
    ));
  }
}
