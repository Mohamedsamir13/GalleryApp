import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photoalbm/Core/MediaQuery/sizes.dart';
import 'package:photoalbm/Features/AlbumsPage/controller/albumController.dart';
import 'package:photoalbm/Features/Data/Model/albumModel.dart';
import 'package:photoalbm/core/Apptext/apptext.dart';

class AlbumsScreen extends StatefulWidget {
  final int? albumId;

  AlbumsScreen({this.albumId});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    albumController
        .getPhotosByAlbumId(widget.albumId!); // TODO: implement initState
    super.initState();
  }

  AlbumModel? model;

  AlbumController albumController = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.grey[100]),
          title: const Center(
            child: AppText(
              text: "Album_screens",
              size: 20,
            ),
          ),
        ),
        body: Obx(
          () => albumController.modelId.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: displayHeight(context) * 0.02),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.05),
                              width: displayWidth(context) * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.1,
                                  vertical: displayHeight(context) * 0.04,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: displayHeight(context) * 0.1,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          index < albumController.modelId.length
                                              ? albumController.modelId[index]
                                              ?.thumbnailUrl ??
                                              "https://lppm.upnjatim.ac.id/assets/img/nophoto.png"
                                              : "",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Instagram",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                          displaySize(context).width * 0.04,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: displayHeight(context) * 0.02),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.04),
                              width: displayWidth(context) * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.1,
                                  vertical: displayHeight(context) * 0.04,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: displayHeight(context) * 0.1,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          index < albumController.modelId.length
                                              ? albumController.modelId[index]
                                                      ?.thumbnailUrl ??
                                                  "https://lppm.upnjatim.ac.id/assets/img/nophoto.png"
                                              : "",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Instagram",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              displaySize(context).width * 0.04,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
                  itemCount: albumController.modelId.length,
                ),
        ));
  }
}
