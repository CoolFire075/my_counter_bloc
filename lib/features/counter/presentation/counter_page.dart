import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_bloc/features/counter/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});


  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'AppBar',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ElevatedButton(
              onPressed: () => bloc.add(
                CounterZeroPressed(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Icon(
                Icons.restore_from_trash,
                color: Colors.teal,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body:  _ButtonsColumn(
        bloc: bloc,
      ),
    );
  }
}

class _ButtonsColumn extends StatelessWidget {
  const _ButtonsColumn({super.key, required this.bloc});

  final CounterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_CounterText()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => bloc.add(CounterIncrementPressed()),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 50,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (prev, curr) => prev.counter != curr.counter,
      builder: (BuildContext context, state) => Text(
        '${state.counter}',
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}
