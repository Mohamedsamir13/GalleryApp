import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbm/Core/Networkservice/dataService.dart';
import 'package:photoalbm/Features/Data/Model/idModel.dart';
import 'package:photoalbm/Features/Data/dataSource/remoteDataSource.dart';

class AlbumController extends GetxController {


  @override

  void
  onInit() {
    getAlbums();
    super.onInit();
  }
  DataSource dataSource=DataSource();

   RxList<AlbumModelid> modelId = RxList();
  RxList model = RxList();

  void getAlbums() async {
    var response = await dataSource.getAlbum();
    if (response is List) {
      model.addAll(response);
    }
  }

  Future getPhotosByAlbumId(int albumId) async {
    try {
      var response = await DataService().getPhotosById(albumId);
      if (response is List) {
        modelId.value = response;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}