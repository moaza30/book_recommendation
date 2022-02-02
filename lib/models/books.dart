class Books {
  final String? id, thumbnail;
  final String? title;
  final String? authors;
  final String? description;

  Books(this.id, this.authors, this.title, this.description, this.thumbnail);

  Books.fromJson(Map<String, dynamic> data)
      : this(
          data['id']! as String,
          data['volumeInfo']['authors']! as String,
          data['volumeInfo']['title']! as String,
          data['volumeInfo']['description']! as String,
          data['volumeInfo']['thumbnail']! as String,
          // thumbnail: getThumbnailSafety(data).replaceAll("http", "https"),
        );
}
