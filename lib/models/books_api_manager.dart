class Books {
  String? thumbnail = '';
  String? title = '';
  String? authors = '';

  Books({this.authors, this.title, this.thumbnail});

  factory Books.fromJson(Map<String, dynamic> data) {
    return Books(
      title: data["volumeInfo"]["title"]!,
      authors: data["volumeInfo"]["authors"][0]!,
      thumbnail: data["volumeInfo"]["imageLinks"]["thumbnail"]!,
    );
  }
}
