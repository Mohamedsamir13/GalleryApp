import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbm/Core/MediaQuery/sizes.dart';
import 'package:photoalbm/Core/Networkservice/dio.dart';
import 'package:photoalbm/Features/Data/Model/albumModel.dart';

class DataSource {
  Dio dio = DioHelper.dio;

  Future<List<AlbumModel>> getAlbum() async {
    String url = 'https://jsonplaceholder.typicode.com/albums/';
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<AlbumModel> albums =
            responseData.map((album) => AlbumModel.fromJson(album)).toList();
        return albums;
      } else {
        print(response.statusCode.toString());
        throw Exception(
            'Failed Load Data with status code ${response.statusCode}');
      }
    } on Exception catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.03,
                  vertical: displayHeight(context) * 0.03),
              children: [Text((e.toString()))],
            );
          });
      rethrow;
    }
  }
}
