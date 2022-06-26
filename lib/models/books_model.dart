class BookModel {
  final String? title;
  final String? authors;
  final String? category;
  final String? description;
  final double? pages;

  BookModel(
      {this.title, this.authors, this.category, this.description, this.pages});

  factory BookModel.fromJson(Map<String, dynamic> data) {
    return BookModel(
      title: data["title"],
      authors: data["authors"],
      description: data["description"],
      category: data["category"],
      pages: data["pages"],
    );
  }
}
