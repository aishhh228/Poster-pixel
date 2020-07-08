import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sleep_application/data/data.dart';
import 'package:sleep_application/model/categories_model.dart';
import 'package:sleep_application/model/wallpaper_model.dart';
import 'package:sleep_application/views/categorie.dart';
import 'package:sleep_application/views/search.dart';
import 'package:sleep_application/widget/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{

  List<CategoriesModel> categories = new List();

  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();


  getTrendingWallpaper()async{
    var response = await http.get("https://api.pexels.com/v1/curated",
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
    getTrendingWallpaper();
    categories = getCategories();
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Search(
                        searchQuery: searchController.text ,
                      )
                    ));
                  },
                    child: Container(
                        child: Icon(Icons.search))),
              ],),
            ),
              SizedBox(height:16,),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoriesTile(
                        title: categories[index].categoriesName,
                        imgUrl: categories[index].imgUrl,
                      );
                    }),
              ),

              wallpaperList(wallpapers:wallpapers, context:context)

          ],),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget{

  final String imgUrl,title;
  CategoriesTile({@required  this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => Categories(
            categorieName:title.toLowerCase(),
          )
        )
        );

      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(imgUrl,height: 50, width: 100, fit: BoxFit.cover,),
            ),
            Container(

              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(13),
              ),
              height: 50, width: 100,
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 15),),)
          ],
        ),
      ),
    );

  }}