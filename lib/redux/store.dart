import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:recurr_fe/redux/state/app_state.dart';
import 'package:recurr_fe/redux/middlewares/logger.dart';
import 'package:recurr_fe/redux/middlewares/syncker.dart';
import 'package:recurr_fe/redux/reducers/root_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

// Any change to the store here, requires an hot restart
Future<Store<AppState>> getStore() async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  final persistor = Persistor<AppState>(
    storage: FileStorage(File(appDocDirectory.path + '/store.json')),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: true,
    shouldSave: (_, dynamic action) => syncableActions.contains(action?.type())
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    rootReducer,
    initialState: initialState ?? AppState(),
    middleware: [
      persistor.createMiddleware(),
      loggerMiddleware,
      syncMiddleware,
      retryMiddleware,
    ],
  );

  return store;
}
