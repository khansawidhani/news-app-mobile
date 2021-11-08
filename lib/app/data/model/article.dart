class NewsData {
  NewsData(
      {required this.status,
      required this.totalResults,
      required this.articles});
  String status;
  int totalResults;
  List<Article> articles;
  factory NewsData.fromJson(Map<String, dynamic> data) {
    final status = data['status'] as String;
    final totalResults = data['totalResults'] as int;
    final articlesData = data['articles'] as List<dynamic>;
    final articles = articlesData
            .map((articleData) => Article.fromJson(articleData))
            .toList()
        // : <Article>[]
        ;
    return NewsData(
        status: status, totalResults: totalResults, articles: articles);
  }
}

class Article {
  Article(
      {required this.source,
      this.author,
      required this.title,
      this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> data) {
    final source = Source.fromJson(data['source']);
    final author = data['author'] as String?;
    final title = data['title'] as String;
    final description = data['description'] as String?;
    final url = data['url'] as String;
    final urlToImage = data['urlToImage'] as String?;
    final publishedAt = data['publishedAt'] as String;
    final content = data['content'] as String?;
    return Article(
        source: source,
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content);
  }
}

class Source {
  Source({this.id, this.name});
  String? id;
  String? name;
  factory Source.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String?;
    final name = data['name'] as String?;
    return Source(id: id, name: name);
  }
}
