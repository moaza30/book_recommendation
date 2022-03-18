class BooksId {
  final String bookId;
  BooksId(this.bookId);
  factory BooksId.fromJson(jsonData) {
    return BooksId(
      jsonData['bookId'],
    );
  }
}
