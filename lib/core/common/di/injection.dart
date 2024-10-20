import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sslmixes/core/common/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
GetIt configureDependencies() => getIt.init();
