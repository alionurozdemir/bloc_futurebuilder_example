import 'package:bloc_futurebuilder_example/Counter/CounterCubit.dart';
import 'package:bloc_futurebuilder_example/Counter/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text("$state");
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text("$state");
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => context.read<CounterCubit>().arttir(), child: Text("Arttır")),
              TextButton(
                  onPressed: () => context.read<CounterCubit>().azalt(), child: Text("Azalt")),
            ],
          )
        ],
      ),
    );
  }
}
