import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sleep_application/data/data.dart';
import 'package:sleep_application/model/wallpaper_model.dart';
import 'package:sleep_application/widget/widget.dart';

class Categories extends StatefulWidget {
  final String categorieName;
  Categories({this.categorieName});



  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<WallpaperModel> wallpapers = new List();
  getSearchWallpaper(String query)async{
    var response = await http.get( "https://api.pexels.com/v1/search?query=$query&per_page=15",
        headers: {
          "Authorization" : apiKey});
//    print(response.body.toString());

    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);


    });
    setState(() {});
  }


  @override
  void initState() {
    getSearchWallpaper(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: brandName(),
          elevation: 0.0,
        ),
        body:SingleChildScrollView(
          child: Container(
            child:Column(
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                wallpaperList(wallpapers: wallpapers,context: context)
              ],),),
        )

    );
  }
}
