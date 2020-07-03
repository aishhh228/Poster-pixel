import 'package:flutter/material.dart';
import 'package:sleep_application/model/wallpaper_model.dart';
import 'package:sleep_application/views/image_view.dart';
Widget brandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Poster",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500), ),
      Text("Pixel",style: TextStyle(color: Colors.deepOrange),)
    ],
  );
}

Widget wallpaperList({List<WallpaperModel> wallpapers,context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount:2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
          child: GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ImageView(
                  imgUrl: wallpaper.src.portrait,
                )
              ));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child:ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(wallpaper.src.portrait,fit: BoxFit.cover,)),
              ),
            ),
          ),
        );

      }).toList(),
    ),
  );

}