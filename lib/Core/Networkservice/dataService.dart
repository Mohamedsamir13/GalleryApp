import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:photoalbm/Core/Apptext/apptext.dart';
import 'package:photoalbm/Core/MediaQuery/sizes.dart';
import 'package:photoalbm/Features/Data/Model/albumModel.dart';
import 'package:photoalbm/Features/Data/Model/idModel.dart';

class DataService {
  String url = 'https://jsonplaceholder.typicode.com/albums/';

  Future<List<AlbumModel>> getAlbum() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return albumModelFromJson(response.body);
      } else {
        print(response.statusCode.toString());
        throw Exception(
            'Failed Load Data with status code ${response.statusCode}');
      }
    }

    on Exception catch (e) {
      Get.back();
      showDialog(context: Get.context!,

          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.03,
                  vertical: displayHeight(context) * 0.03),
              children: [Text((e.toString()))],
            );
          }
      );
      rethrow;
    }
  }

  Future<List<AlbumModelid>> getPhotosById(var id) async {
    try {
      var response = await http.get(Uri.parse("$url$id/photos"));
      if (response.statusCode == 200) {
        return albumModelidFromJson(response.body);
      } else {
        print(response.statusCode.toString());
        throw Exception(
            'Failed Load Data with status code ${response.statusCode}');
      }
    } on Exception catch (e) {
      Get.back();
      showDialog(context: Get.context!,

          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.03,
                  vertical: displayHeight(context) * 0.03),
              children: [Text((e.toString()))],
            );
          }
      );
      rethrow;
    }
  }
}