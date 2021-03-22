class GithubEntity {
  final String name;
  final String createDate;
  final String language;
  final int size;

  GithubEntity({
    this.name,
    this.createDate,
    this.language,
    this.size,
  });

  factory GithubEntity.fromJson(Map<String, dynamic> json) =>
      GithubEntity(
        name: json["name"],
        createDate: json["created_at"],
        language: json["language"],
        size: json["size"],
      );
}
