import 'package:github_redux_demo/reducers/github_data_reducer.dart';
import 'package:github_redux_demo/state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    githubData: githubDataReducer(state.githubData, action),
  );
}
