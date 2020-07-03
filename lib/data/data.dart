import 'package:flutter/cupertino.dart';
import 'package:sleep_application/model/categories_model.dart';
String apiKey ="563492ad6f91700001000001e3cfdfe77c2346889bb3cb54a6ce8b38";

List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();
// wild life
  categoriesModel.imgUrl ="https://images.pexels.com/photos/16066/pexels-photo.jpg?cs=srgb&dl=elephants-calf-baby-elephant-elephant-tusks-16066.jpg&fm=jpg";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
// Nature
  categoriesModel.imgUrl ="https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?cs=srgb&dl=daylight-forest-glossy-lake-443446.jpg&fm=jpg";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
// Street Art
  categoriesModel.imgUrl ="https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?cs=srgb&dl=black-road-bike-leaning-on-red-blue-and-white-wing-graffiti-545008.jpg&fm=jpg";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
//Music
  categoriesModel.imgUrl ="https://images.pexels.com/photos/1626481/pexels-photo-1626481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Music";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
//Dance
  categoriesModel.imgUrl ="https://images.pexels.com/photos/1886694/pexels-photo-1886694.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Dance";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
//Fitness
  categoriesModel.imgUrl ="https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Fitness";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();







  return categories;
}