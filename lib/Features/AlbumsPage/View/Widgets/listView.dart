import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbm/Core/MediaQuery/sizes.dart';
import 'package:photoalbm/Features/AlbumsPage/View/Screens/albumScreen.dart';
import 'package:photoalbm/Features/AlbumsPage/controller/albumController.dart';
import 'package:photoalbm/Features/Data/Model/idModel.dart';
import 'package:photoalbm/core/Apptext/apptext.dart';
import 'package:sizer/sizer.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  AlbumController albumController = Get.put(AlbumController());
  AlbumModelid? albumModelid;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => albumController.model.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(displaySize(context).width / 40),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * 0.010,
                        vertical: displayHeight(context) * 0.02),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            albumController.getPhotosByAlbumId(1);
                            Get.to(() => AlbumsScreen(
                                albumId: albumController.model[index].id));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.redAccent,
                                child: AppText(
                                  text: albumController.model[index].id
                                      .toString(),
                                  size: 2.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: AppText(
                                  text: albumController.model[index].title,
                                  size: displaySize(context).width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                itemCount: albumController.model.length,
              ),
            ),
    );
  }
}
