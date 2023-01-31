import 'package:get_it/get_it.dart';

import '../modules/register/cubit/register_cubit.dart';

final getIt = GetIt.instance;

setUpProviders() {
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit());
}
