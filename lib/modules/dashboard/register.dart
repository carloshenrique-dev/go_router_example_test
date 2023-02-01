import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example_test/services/dependency_injection.dart';

import 'cubit/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health integration'),
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        bloc: getIt<DashboardCubit>(),
        builder: (context, state) {
          print(state.data);
          return ListView.separated(
            itemCount: state.data.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    state.data[index].sourceName,
                  ),
                  Text(
                    state.data[index].typeString,
                  ),
                  Text(
                    '${state.data[index].unit}',
                  ),
                  Text(
                    '${state.data[index].type}',
                  ),
                  Text(
                    '${state.data[index].value}',
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async => getIt<DashboardCubit>()..getHealthData()),
    );
  }
}
