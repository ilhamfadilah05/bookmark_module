// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  var listBookmark = [].obs;
  var title = "Bookmark Ayat".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listBookmark.value = jsonDecode(prefs.getString("listBookmark")!);
  }

  tapAyat(String idSurah, String namaSurah, String ayat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("idSurah", idSurah);
    prefs.setString("namaSurah", namaSurah);
    prefs.setString("ayat", ayat);
  }
}
