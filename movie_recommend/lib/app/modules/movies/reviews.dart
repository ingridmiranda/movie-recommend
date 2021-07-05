import 'dart:convert';

class Reviews {
  String author;
  String content;
  Reviews({
    this.author,
    this.content,
  });

  Reviews copyWith({
    String author,
    String content,
  }) {
    return Reviews(
      author: author ?? this.author,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'content': content,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    String content = map['content'];
    content = content.replaceAll("**", "");
    content = content.replaceAll("_", "");
    print(content);
  
    return Reviews(
      author: map['author'],
      content: content,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) => Reviews.fromMap(json.decode(source));

  @override
  String toString() => 'Reviews(author: $author, content: $content)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Reviews &&
      o.author == author &&
      o.content == content;
  }

  @override
  int get hashCode => author.hashCode ^ content.hashCode;
}
