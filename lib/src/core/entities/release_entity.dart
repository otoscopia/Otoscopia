class ReleaseEntity {
  final String title;
  final String body;
  final String releaseDate;

  ReleaseEntity({required this.title, required this.body, required this.releaseDate});

  factory ReleaseEntity.fromJson(Map<String, dynamic> json) {
    return ReleaseEntity(
      title: json['name'] ?? 'No title',
      body: json['body'] ?? 'No description',
      releaseDate: json['published_at'] ?? 'No date',
    );
  }
}
