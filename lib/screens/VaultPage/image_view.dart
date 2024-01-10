import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/app_textstyle.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/controller/image_view_controller.dart';
import 'package:untitled/screens/VaultPage/photo_vault_screen.dart';
import 'package:untitled/widgets/alert_dialog_box.dart';
import 'package:untitled/widgets/app_bar.dart';
import 'package:untitled/widgets/button_view.dart';
import 'package:untitled/widgets/toast.dart';

class ImageViewScreen extends StatefulWidget {
  final Medium medium;
  final List<Medium> imageList;
  const ImageViewScreen(
      {Key? key, required this.medium, required this.imageList})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  ImageViewController imageViewController = Get.put(ImageViewController());
  final TextEditingController rename = TextEditingController();
  PageController? pageController;
  InterstitialAd? _interstitialAd;
  

  // ignore: non_constant_identifier_names
  

  @override
  void initState() {
    imageViewController.imageList.value = widget.imageList;
    for (int i = 0; i < imageViewController.imageList.length; i++) {
      if (imageViewController.imageList[i].id == widget.medium.id) {
        imageViewController.currentIndex.value = i;
        break;
      }
    }
    () async {
      
    }();
    pageController =
        PageController(initialPage: imageViewController.currentIndex.value);
    super.initState();
  }

  void _animateSlider() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      imageViewController.currentIndex.value++;
      if (imageViewController.currentIndex.value ==
          imageViewController.imageList.length) {
        imageViewController.currentIndex.value = 0;
      }
      if (pageController!.hasClients) {
        pageController!
            .animateToPage(imageViewController.currentIndex.value,
                duration: const Duration(seconds: 1), curve: Curves.linear)
            .then((_) => _animateSlider());
      }
    });
  }

  void bottomShet(BuildContext context) async {
    File file = await imageViewController
        .imageList[imageViewController.currentIndex.value]
        .getFile();
    String path = file.path;
    // ignore: use_build_context_synchronously
    showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        builder: (context) {
          return Obx(() => Container(
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                            context: context,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            clipBehavior: Clip.hardEdge,
                            builder: (context) {
                              return Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color:  AppColors.blackColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        int location =
                                            WallpaperManager.LOCK_SCREEN;
                                        bool result = await WallpaperManager
                                            .setWallpaperFromFile(
                                                path, location);
                                        if (result) {
                                          // ignore: use_build_context_synchronously
                                          showToast(
                                              context, "Wallpaper is set..");
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showToast(context,
                                              "Wallpaper is not set..");
                                        }
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Lock Screen",
                                          style: AppTextStyle.regularTextStyle
                                              .copyWith(
                                                  color:AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        int location =
                                            WallpaperManager.HOME_SCREEN;
                                        bool result = await WallpaperManager
                                            .setWallpaperFromFile(
                                                path, location);
                                        if (result) {
                                          // ignore: use_build_context_synchronously
                                          showToast(
                                              context, "Wallpaper is set..");
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showToast(context,
                                              "Wallpaper is not set..");
                                        }
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Home Screen",
                                          style: AppTextStyle.regularTextStyle
                                              .copyWith(
                                                  color:  AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        int location =
                                            WallpaperManager.BOTH_SCREEN;
                                        bool result = await WallpaperManager
                                            .setWallpaperFromFile(
                                                path, location);
                                        if (result) {
                                          // ignore: use_build_context_synchronously
                                          showToast(
                                              context, "Wallpaper is set..");
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showToast(context,
                                              "Wallpaper is not set..");
                                        }
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Both Screen",
                                          style: AppTextStyle.regularTextStyle
                                              .copyWith(
                                                  color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Set as wallpaper",
                          style: AppTextStyle.regularTextStyle.copyWith(
                              color:AppColors.whiteColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        _animateSlider();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Slideshow",
                          style: AppTextStyle.regularTextStyle.copyWith(
                              color:  AppColors.whiteColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        String name = path.split("/").last.split(".").first;
                        String ext = path.split("/").last.split(".").last;
                        rename.text = name;
                        showModalBottomSheet(
                            context: context,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            clipBehavior: Clip.hardEdge,
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Container(
                                  height: 170,
                                  decoration: BoxDecoration(
                                      color:AppColors.blackColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  child: ListView(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.primaryColor
                                              .withOpacity(0.2),
                                          child: TextFormField(
                                            controller: rename,
                                            style: AppTextStyle.smallTextStyle
                                                .copyWith(
                                              color:
                                                   AppColors.whiteColor,
                                            ),
                                            decoration: const InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      buttonView(
                                          title: "Save",
                                          onTap: () async {
                                            final newPath = await ExternalPath
                                                .getExternalStoragePublicDirectory(
                                                    ExternalPath
                                                        .DIRECTORY_PICTURES);
                                            name = rename.text;
                                            File newFile = await file.rename(
                                                "$newPath/image/$name.$ext");
                                            log(newFile.path);
                                            // ignore: use_build_context_synchronously
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const PhotoVaultScreen()),
                                                    (route) => false);
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Rename",
                          style: AppTextStyle.regularTextStyle.copyWith(
                              color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                            context: context,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            clipBehavior: Clip.hardEdge,
                            builder: (context) {
                              return Container(
                                height: 250,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                    color:AppColors.blackColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Text(
                                          "Details",
                                          style: AppTextStyle.regularTextStyle
                                              .copyWith(
                                                  color:  AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Name : ${imageViewController.imageList[imageViewController.currentIndex.value].filename!}",
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                                color:AppColors.whiteColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Date : ${imageViewController.imageList[imageViewController.currentIndex.value].creationDate.toString().substring(0, 11)}",
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                                color: AppColors.whiteColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Location : $path",
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                                color: AppColors.whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Details",
                          style: AppTextStyle.regularTextStyle.copyWith(
                              color:AppColors.whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 50),
        child: Obx(() => appBar(
            title: imageViewController
                .imageList[imageViewController.currentIndex.value].filename!,
            isBackIcon: true,
            context: context)),
      ),
      body: PageView.builder(
          itemCount: imageViewController.imageList.length,
          controller: pageController,
          onPageChanged: (val) {
            imageViewController.currentIndex.value = val;
          },
          itemBuilder: (context, index) {
            return Obx(() => Center(
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    imageErrorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Image is private...');
                    },
                    placeholder: MemoryImage(kTransparentImage),
                    image: PhotoProvider(
                      mediumId: imageViewController.imageList[index].id,
                    ),
                  ),
                ));
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    File file = await imageViewController
                        .imageList[imageViewController.currentIndex.value]
                        .getFile();
                    XFile xFile = XFile(file.path);
                    ShareResult result = await Share.shareXFiles([xFile]);
                    if (result.status == ShareResultStatus.success) {
                      log("share successfuly");
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Obx(
                            () => SvgPicture.asset(
                              "assets/icon/share.svg",
                              color:AppColors.blackColor,
                            ),
                          ))),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Share",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    File file = await imageViewController
                        .imageList[imageViewController.currentIndex.value]
                        .getFile();
                    Uint8List bytes = file.readAsBytesSync();
                    // ignore: use_build_context_synchronously
                    Uint8List? editedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageEditor(
                          image: bytes,
                          // appBarColor: AppColors.primaryColor,
                          savePath: file.path,
                        ),
                      ),
                    );
                    if (editedImage != null) {
                      final convertedImage = await ImageUtils.convert(
                        editedImage,
                      );
                      final path =
                          await ExternalPath.getExternalStoragePublicDirectory(
                              ExternalPath.DIRECTORY_PICTURES);
                      String ext = file.path.split("/").last.split(".").last;
                      String name =
                          "EditImage-${DateTime.now().microsecondsSinceEpoch.toString()}.$ext";
                      await File("$path/image/$name")
                          .writeAsBytes(convertedImage);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(
                              builder: (context) => const PhotoVaultScreen()),
                          (route) => false);
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Obx(
                            () => SvgPicture.asset(
                              "assets/icon/edit.svg",
                              color: AppColors.blackColor,
                            ),
                          ))),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Edit",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    alertDialogView(
                        context: context,
                        title: "Delete",
                        contet: "Are you sure to delete?",
                        yesPress: () async {
                          File file = await PhotoGallery.getFile(
                              mediumId: imageViewController
                                  .imageList[
                                      imageViewController.currentIndex.value]
                                  .id);
                          await file.delete();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                              // ignore: use_build_context_synchronously
                              CupertinoDialogRoute(
                                  builder: (context) => const PhotoVaultScreen(),
                                  context: context),
                              (route) => false);
                        },
                        noPress: () {
                          Navigator.of(context).pop();
                        });
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Obx(
                            () => SvgPicture.asset(
                              "assets/icon/delete.svg",
                              color:AppColors.blackColor,
                            ),
                          ))),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Delete",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (SharePref.instance
                            .getBool(SharePref.isLockDone) ==
                        true) {
                      alertDialogView(
                          context: context,
                          title: "Lock",
                          contet: "Are you sure to lock?",
                          yesPress: () async {
                            final path = await ExternalPath
                                .getExternalStoragePublicDirectory(
                                    ExternalPath.DIRECTORY_PICTURES);
                            final folderPath =
                                Directory("$path/gallerySafe/photos/.private");
                            String safePath = folderPath.path;
                            File file = await imageViewController.imageList[
                                    imageViewController.currentIndex.value]
                                .getFile();
                            String name = file.path.split("/").last;
                            File newFile = file.copySync("$safePath/$name");
                            log(newFile.path);
                            await file.delete(recursive: true);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                    builder: (context) => const PhotoVaultScreen()),
                                (route) => false);
                          },
                          noPress: () {
                            Navigator.of(context).pop();
                          });
                    } else {
                      showToast(context, "Please set vault password");
                    }
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Obx(() => SvgPicture.asset(
                                    "assets/icon/lock_black.svg",
                                    color: AppColors.blackColor,
                                  )))),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Lock",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    bottomShet(context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 30,
                          child: Center(
                              child: Obx(
                            () => SvgPicture.asset(
                              "assets/icon/more.svg",
                              color:  AppColors.blackColor,
                            ),
                          ))),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "More",
                        style: AppTextStyle.smallTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
