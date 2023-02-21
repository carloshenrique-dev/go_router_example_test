import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example_test/modules/dashboard/widgets/simple_card_widget.dart';
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
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: state.data.length,
            /*separatorBuilder: (context, index) {
              return const Divider();
            },*/
            itemBuilder: (context, index) {
              return SimpleCardWidget(
                value: '${state.data[index].value}',
                type: state.data[index].typeString,
                date: state.data[index].dateFrom.toString(),
              );
              /*return Column(
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
              );*/
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async => getIt<DashboardCubit>()..getHealthData()),
    );
  }
}
