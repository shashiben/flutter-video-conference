// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:video_conference/services/agora_service.dart';
import 'package:video_conference/services/authentication_service.dart';
import 'package:video_conference/services/firestore_service.dart';
import 'package:video_conference/services/imagepicker_service.dart';
import 'package:video_conference/services/stacked_services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_conference/services/storage_service.dart';
import 'package:video_conference/services/user_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerExternalServices = _$RegisterExternalServices();
  g.registerLazySingleton<AgoraService>(() => AgoraService());
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
  g.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
  g.registerLazySingleton<NavigationService>(
      () => registerExternalServices.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerExternalServices.snackbarService);
  g.registerLazySingleton<StorageService>(() => StorageService());
  g.registerLazySingleton<UserService>(() => UserService());
}

class _$RegisterExternalServices extends RegisterExternalServices {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
