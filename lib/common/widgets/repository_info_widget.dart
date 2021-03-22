import 'package:flutter/material.dart';
import 'package:github_redux_demo/model/github_entity.dart';

class RepositoryInfoWidget extends StatelessWidget {
  final GithubEntity githubEntity;
  RepositoryInfoWidget({this.githubEntity});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        githubEntity.name,
      ),
      subtitle: Text(
        githubEntity.language ?? "",
      ),
      trailing: Text(
        githubEntity.size.toString(),
      ),
    );
  }
}
