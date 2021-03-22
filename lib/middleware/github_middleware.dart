import 'dart:convert';

import 'package:github_redux_demo/model/github_entity.dart';
import 'package:github_redux_demo/actions/github_actions.dart';
import 'package:github_redux_demo/state.dart';
import 'package:github_redux_demo/utils/constants.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

Middleware<AppState> fetchDataMiddleware() {
  final fetchData = _fetchDataMiddleware();

  return TypedMiddleware<AppState, FetchDataGithub>(fetchData);
}

Middleware<AppState> _fetchDataMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    if (action is FetchDataGithub) {
      try {
        Uri url = Uri.https(
          Constants.BASE_URL,
          "users/matviivm/repos",
        );

        var response = await http.get(url, headers: {
          "Access-Control-Allow-Origin": "*",
          "Accept": "application/vnd.github.v3+json"
        });
        if (response.statusCode == 200) {
          List<GithubEntity> _githubRepository = jsonDecode(response.body)
              .map<GithubEntity>((json) => GithubEntity.fromJson(json))
              .toList();
          store.dispatch(
            FetchDataGithubSuccessful(_githubRepository),
          );
        } else {
          store.dispatch(
            FetchDataGithubFail("Error"),
          );
        }
      } catch (error) {
        store.dispatch(
          FetchDataGithubFail(error.toString()),
        );
      }
    }
    next(action);
  };
}
