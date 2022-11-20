import 'package:flutter/material.dart';
import 'package:state/viewmodel/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CounterViewModel>();
    // Provider.of<CounterViewModel>(context,listen: false) ; // read
    // Provider.of<CounterViewModel>(context) ; // true

    return Scaffold(
        body: Column(
          children: [
            Consumer<CounterViewModel>(builder: (context, valie, child) {
              return Text(valie.counter.currentNumber.toString());
            }),
            Builder(
              builder: (
                context,
              ) {
                print("counter build");
                context.watch<CounterViewModel>();
                return Text(viewModel.counter.currentNumber.toString());
              },
            ),
            Selector<CounterViewModel, bool>(builder: ((context, value, child) {
              return Text(value.toString());
            }), selector: (context, viewmodel) {
              return viewModel.counter.currentNumber.isNegative;
            }),
            Builder(
              builder: (
                context,
              ) {
                print("isNegative build");
                final res = context.select<CounterViewModel, bool>((value) {
                  return value.counter.currentNumber.isNegative;
                });
                return Text(res.toString());
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                viewModel.inc();
              },
            ),
            FloatingActionButton(
              onPressed: () {
                viewModel.dec();
              },
            ),
          ],
        ));
  }
}
