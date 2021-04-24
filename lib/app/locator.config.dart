// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../core/services/authentication_service.dart' as _i3;
import '../core/services/image_picker_service.dart' as _i5;
import '../core/services/stacked_services.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerExternalServices = _$RegisterExternalServices();
  gh.lazySingleton<_i3.AuthenticationService>(
      () => _i3.AuthenticationService());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => registerExternalServices.bottomSheetService);
  gh.lazySingleton<_i4.DialogService>(
      () => registerExternalServices.dialogService);
  gh.lazySingleton<_i5.ImagePickerService>(() => _i5.ImagePickerService());
  gh.lazySingleton<_i4.NavigationService>(
      () => registerExternalServices.navigationService);
  gh.lazySingleton<_i4.SnackbarService>(
      () => registerExternalServices.snackbarService);
  return get;
}

class _$RegisterExternalServices extends _i6.RegisterExternalServices {
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackbarService => _i4.SnackbarService();
}
