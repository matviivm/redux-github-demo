import 'package:github_redux_demo/model/github_entity.dart';
import 'package:github_redux_demo/actions/github_actions.dart';
import 'package:redux/redux.dart';

final githubDataReducer =
    TypedReducer<List<GithubEntity>, FetchDataGithubSuccessful>(
        _fetchData);

List<GithubEntity> _fetchData(
    List<GithubEntity> data, action) {
  return action.data;
}
