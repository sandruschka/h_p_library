import 'package:get_it/get_it.dart';
import 'package:h_p_library/di/global_providers.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);
