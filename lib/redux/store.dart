import 'dart:io';

import 'package:recurr_fe/redux/appState.dart';
import 'package:recurr_fe/redux/middlewares/logger.dart';
import 'package:recurr_fe/redux/reducers/root_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

// Any change to the store here, requires an hot restart
Future<Store<AppState>> getStore() async {
  final persistor = Persistor<AppState>(
    storage: FileStorage(File('store.json')),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: true,
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    rootReducer,
    initialState: initialState ?? AppState(),
    middleware: [persistor.createMiddleware(), loggerMiddleware],
  );

  return store;
}
