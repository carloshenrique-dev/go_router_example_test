part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String message;

  const RegisterState._({
    this.message = '',
  });

  const RegisterState.initial() : this._();

  RegisterState copyWith({
    String? message,
  }) {
    return RegisterState._(
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [message];
}
