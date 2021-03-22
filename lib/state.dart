import 'package:github_redux_demo/model/github_entity.dart';

class AppState {
  final List<GithubEntity> githubData;

  AppState({
    this.githubData = const [],
  });

  AppState copyWith() {
    return new AppState(
      githubData: githubData ?? this.githubData,
    );
  }
}
