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
    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return "https://yt3.ggpht.com/ytc/AKedOLR0Q2jl80Ke4FS0WrTjciAu_w6WETLlI0HmzPa4jg=s176-c-k-c0x00ffffff-no-rj";
      }
    }

    return Books(
      id: data['id'],
      title: data["volumeInfo"]["title"],
      authors: data["volumeInfo"]["authors"][0],
      thumbnail: getThumbnailSafety(data).replaceAll("httpss", "https"),
      description: data['volumeInfo']['description'],
      publishedDate: data['volumeInfo']['publishedDate'],
      webRead: data['volumeInfo']['previewLink'],
    );
  }
}
