class BookmarkModel {
  String? id;
  String? link;
  String? title;
  String? imageUrl;

  BookmarkModel({
    this.id,
    this.link,
    this.title,
    this.imageUrl,
  });

  BookmarkModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
    title = map['title'];
    imageUrl = map['imageUrl'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "link": link,
        "title": title,
        "imageUrl": imageUrl,
      };
}
