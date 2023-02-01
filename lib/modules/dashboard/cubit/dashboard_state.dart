part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final String message;
  final List<HealthDataPoint> data;

  const DashboardState._({
    this.message = '',
    this.data = const [],
  });

  const DashboardState.initial() : this._();

  DashboardState copyWith({
    String? message,
    List<HealthDataPoint>? data,
  }) {
    return DashboardState._(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [message, data];
}
