import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_redux_demo/common/widgets/repository_info_widget.dart';
import 'package:github_redux_demo/model/github_entity.dart';
import 'package:github_redux_demo/actions/github_actions.dart';
import 'package:github_redux_demo/state.dart';
import 'package:redux/redux.dart';

class GithubPage extends StatelessWidget {
  GithubPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, GithubPageProperties>(
        converter: (store) => mapStateToProps(store),
        onInit: (store) => store.dispatch(FetchDataGithub()),
        builder: (context, GithubPageProperties properties) {
          List<GithubEntity> data = properties.githubData;
          return data.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return RepositoryInfoWidget(githubEntity: data[index]);
                  },
                );
        },
      ),
    );
  }
}

class GithubPageProperties {
  final List<GithubEntity> githubData;

  GithubPageProperties({this.githubData});
}

GithubPageProperties mapStateToProps(Store<AppState> store) {
  return GithubPageProperties(
    githubData: store.state.githubData,
  );
}
