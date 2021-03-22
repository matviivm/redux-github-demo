import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_redux_demo/github_page.dart';

import 'package:github_redux_demo/middleware/github_middleware.dart';
import 'package:github_redux_demo/reducers/app_reducer.dart';
import 'package:github_redux_demo/state.dart';

import 'package:redux/redux.dart';

void main() {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: []..add(fetchDataMiddleware()),
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: GithubPage(),
        ),
      ),
    );
  }
}
