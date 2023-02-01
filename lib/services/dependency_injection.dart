import 'package:get_it/get_it.dart';
import 'package:go_router_example_test/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:health/health.dart';

final getIt = GetIt.instance;

setUpProviders() {
  getIt.registerLazySingleton<HealthFactory>(() => HealthFactory());
  getIt.registerLazySingleton<DashboardCubit>(
    () => DashboardCubit(healthFactory: getIt<HealthFactory>()),
  );
}
