class Books {
  String? thumbnail, id, webRead;
  String? title, publishedDate;
  String? authors, description;

  Books(
      {this.id,
      this.authors,
      this.title,
      this.thumbnail,
      this.description,
      this.publishedDate,
      this.webRead});

  factory Books.fromJson(Map<String, dynamic> data) {
    return Books(
      id: data['id'],
      title: data["volumeInfo"]["title"],
      authors: data["volumeInfo"]["authors"][0],
      thumbnail: data["volumeInfo"]["imageLinks"]["thumbnail"],
      description: data['volumeInfo']['description'],
      publishedDate: data['volumeInfo']['publishedDate'],
      webRead: data['volumeInfo']['webReaderLink'],
    );
  }
}
