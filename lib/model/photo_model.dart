
class PhotoModel {
  int total;
  int totalPages;
  List<Result> results;

  PhotoModel({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    total: json["total"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String? id;
 //String? slug;
 //DateTime? createdAt;
 //DateTime? updatedAt;
 int? width;
 int? height;
 String? color;
 Urls? urls;

  Result({
    this.id,

    this.width,
    this.height,
    this.color,
    this.urls,

  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    width: json["width"],
    height: json["height"],
    color: json["color"],
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "width": width,
    "height": height,
    "color": color,
    "urls": urls!.toJson(),
  };
}



class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}






