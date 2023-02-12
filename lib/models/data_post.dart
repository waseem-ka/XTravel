class DataPost {
  final int id;
  final String title;
  final String body;

  DataPost({
    required this.id,
    required this.title,
    required this.body,
  });

  DataPost.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        body = data['body'];
}
