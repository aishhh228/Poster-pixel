import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sleep_application/data/data.dart';
import 'package:sleep_application/model/wallpaper_model.dart';
import 'package:sleep_application/widget/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getSearchWallpaper(String query)async{
    var response = await http.get( "https://api.pexels.com/v1/search?query=$query&per_page=15",
        headers: {
          "Authorization" : apiKey});


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
      getSearchWallpaper(widget.searchQuery);
    super.initState();
    searchController.text =widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body:SingleChildScrollView(
        child: Container(
          child:Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
               borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: <Widget>[
                 Expanded(
                  child:TextField(
                controller: searchController,
                decoration: InputDecoration(
                hintText: "search",

                border: InputBorder.none,
                  ),
               ),
              ),
                 GestureDetector(
                  onTap: (){
                      getSearchWallpaper(searchController.text);
                   },
                     child: Container(
                        child: Icon(Icons.search, color: Colors.white,))),
              ],),
          ),
              SizedBox(
                height: 16,
              ),
              wallpaperList(wallpapers: wallpapers,context: context)
    ],),),
      )
    );
  }
}
