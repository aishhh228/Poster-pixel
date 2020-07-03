class WallpaperModel{
  String photographer;
  String phototgrapher_url;
  int phototgrapher_id;
  SrcModel src;

  WallpaperModel({this.src,this.phototgrapher_url,this.phototgrapher_id, this.photographer,});
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      phototgrapher_url: jsonData["phototgrapher_url"],
      phototgrapher_id: jsonData["phototgrapher_id"],
      photographer: jsonData["phototgrapher"]
    );
  }

}

class SrcModel{

  String original;
  String small;
  String portrait;
  SrcModel({this.portrait,this.original,this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"]

    );
  }

}