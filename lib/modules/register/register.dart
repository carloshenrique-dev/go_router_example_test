import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example_test/modules/register/cubit/register_cubit.dart';
import 'package:go_router_example_test/services/dependency_injection.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste'),
      ),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        bloc: getIt<RegisterCubit>()..printar(),
        builder: (context, state) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
