import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health/health.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final HealthFactory _healthFactory;

  DashboardCubit({
    required HealthFactory healthFactory,
  })  : _healthFactory = healthFactory,
        super(const DashboardState.initial());

  Future<void> getHealthData() async {
    // define the types to get
    var types = [
      HealthDataType.ACTIVE_ENERGY_BURNED,
      //HealthDataType.AUDIOGRAM,
      //HealthDataType.BASAL_ENERGY_BURNED,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
      HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
      HealthDataType.BODY_FAT_PERCENTAGE,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.BODY_TEMPERATURE,
      //HealthDataType.DIETARY_CARBS_CONSUMED,
      //HealthDataType.DIETARY_ENERGY_CONSUMED,
      //HealthDataType.DIETARY_FATS_CONSUMED,
      //HealthDataType.DIETARY_PROTEIN_CONSUMED,
      //HealthDataType.FORCED_EXPIRATORY_VOLUME,
      HealthDataType.HEART_RATE,
      //HealthDataType.HEART_RATE_VARIABILITY_SDNN,
      HealthDataType.HEIGHT,
      //HealthDataType.RESTING_HEART_RATE,
      HealthDataType.STEPS,
      //HealthDataType.WAIST_CIRCUMFERENCE,
      //HealthDataType.WALKING_HEART_RATE,
      HealthDataType.WEIGHT,
      //HealthDataType.DISTANCE_WALKING_RUNNING,
      //HealthDataType.FLIGHTS_CLIMBED,

      //informacao desnecessaria
      //HealthDataType.MOVE_MINUTES,

      HealthDataType.DISTANCE_DELTA,
      //HealthDataType.MINDFULNESS,
      HealthDataType.WATER,
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      //HealthDataType.EXERCISE_TIME,
      HealthDataType.WORKOUT,
      //HealthDataType.HEADACHE_NOT_PRESENT,
      //HealthDataType.HEADACHE_MILD,
      //HealthDataType.HEADACHE_MODERATE,
      //HealthDataType.HEADACHE_SEVERE,
      //HealthDataType.HEADACHE_UNSPECIFIED,
    ];

    // requesting access to the data types before reading them
    bool requested = await _healthFactory.requestAuthorization([
      HealthDataType.DISTANCE_DELTA,
    ]);

    var now = DateTime.now();

    // fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await _healthFactory
        .getHealthDataFromTypes(now.subtract(const Duration(days: 3)), now, [
      HealthDataType.DISTANCE_DELTA,
    ]);

    emit(state.copyWith(data: healthData.toSet().toList()));

    // write steps and blood glucose
    bool success = await _healthFactory.writeHealthData(
        10, HealthDataType.STEPS, now, now);
    success = await _healthFactory.writeHealthData(
        3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

    // get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await _healthFactory.getTotalStepsInInterval(midnight, now);

    // request permissions to write steps and blood glucose
    /*types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);*/
  }
}
