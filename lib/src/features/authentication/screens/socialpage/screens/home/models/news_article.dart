class NewsArticle {
  final String title;
  final String description;
  final String content;
  final String urlToImage;
  final String publishedAt;
  final String author;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.content,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      content: json['content'] ?? 'No Content',
      urlToImage: json['urlToImage'] ?? 'https://via.placeholder.com/150',
      publishedAt: json['publishedAt'] ?? '',
      author: json['author'] ?? 'Unknown',
      url: json['url'] ?? '',
    );
  }
}
