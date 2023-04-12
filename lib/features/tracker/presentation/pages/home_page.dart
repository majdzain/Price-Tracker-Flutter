import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/features/tracker/presentation/cubits/symbols/symbols_cubit.dart';
import 'package:price_tracker/features/tracker/presentation/cubits/ticks/ticks_cubit.dart';
import 'package:price_tracker/features/tracker/presentation/screens/dropdowns_screen.dart';
import 'package:price_tracker/features/tracker/presentation/widgets/dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymbolsCubit, SymbolsState>(builder: (_, state) {
      if (state is LoadingSymbolsState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LoadedSymbolsState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Price Tracker'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              DropdownsScreen(
                symbols: state.symbols,
                onSelectSymbol: (symbol, isWithPrevious) {
                  BlocProvider.of<TicksCubit>(context)
                      .getTickByTick(symbol, isWithPrevious);
                },
                stopUntil: () {
                  BlocProvider.of<TicksCubit>(context).stopUntil();
                },
              ),
              const SizedBox(height: 20),
              Expanded(child: Center(
                child: BlocBuilder<TicksCubit, TicksState>(
                  builder: (context, state) {
                    if (state is LoadingTickState) {
                      return const CircularProgressIndicator();
                    } else if (state is LoadedTickState) {
                      return Text(
                        "Price: ${state.tick.quote}",
                        style: TextStyle(
                            fontSize: 23,
                            color: state.previousPrice == state.tick.quote
                                ? Colors.grey
                                : state.previousPrice > state.tick.quote
                                    ? Colors.red
                                    : Colors.green),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ))
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
