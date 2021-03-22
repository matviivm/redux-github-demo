import 'package:github_redux_demo/model/github_entity.dart';

class FetchDataGithub {}

class FetchDataGithubSuccessful {
  final List<GithubEntity> data;
  FetchDataGithubSuccessful(this.data);
}

class FetchDataGithubFail {
  final String error;
  FetchDataGithubFail(this.error);
}
