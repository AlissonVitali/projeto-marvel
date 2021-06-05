class ComicIssue {
  String title;
  String description;
  String modified;
  String ups;
  String format;
  List date;
  List prices;
  List images;
  List creators;
  List characters;
  List stories;
  List events;
  List<String> options;

  String type;

  ComicIssue(
      {this.title,
  this.description,
  this.modified,
  this.ups,
  this.format,
  this. date,
  this. prices,
  this. images,
  this. creators,
  this. characters,
  this. stories,
  this. events,
      this.options});

  factory ComicIssue.fromJson(Map<String, dynamic> json) {
    return ComicIssue(
        title: json['title'],
        description: json['description'],
        modified: json['modified'],
        ups: json['ups'],
        format: json['format'],
        date: json['dates'],
        prices: json['prices'],//.cast<String>()..shuffle(),
        images: json['images'] = (json['images'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),
        creators: json['creators']['items'],//.cast<String , dynamic>,
        characters: json['characters']['items'],
        // = (json['characters']['items'] as List)
        //      ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
        //      ?.toList(),
        stories: json['stories']['items'] = (json['stories']['items'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),
        events: json['events']['items'] = (json['events']['items'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),);
  }
}
class Character{
   String name;
  String thumbnail;
  String modified;
  String ups;
  List date;
  List prices;
 List images;
  List creators;
  List characters;
  List stories;
  List events;
  List<String> options;

  String type;

  Character(
      {this.name,
  this.thumbnail,
  this.modified,
  this.ups,
  this. date,
  this. prices,
  this. images,
  this. creators,
  this. characters,
  this. stories,
  this. events,
      this.options});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        name: json['name'],
        thumbnail: json['thumbnail'],
        modified: json['modified'],
        ups: json['ups'],
        date: json['dates'],
        prices: json['prices'],//.cast<String>()..shuffle(),
        images: json['images'] = (json['images'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),
        creators: json['creators']['items'],//.cast<String , dynamic>,
        characters: json['characters']['items']= (json['characters']['items'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),
        stories: json['stories']['items'] = (json['stories']['items'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),
        events: json['events']['items'] = (json['events']['items'] as List)
             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
             ?.toList(),);
  }
}


// parsedJson["fields"] = (parsedJson['fields'] as List)
//             ?.map((e) => e == null ? null : Map<String, dynamic>.from(e))
//             ?.toList()