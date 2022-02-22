// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);
