import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_tracker/core/helpers/web_socket_helper.dart';
import 'package:price_tracker/features/tracker/presentation/pages/home_page.dart';
import 'package:price_tracker/injection_container.dart' as ic;
import 'package:price_tracker/features/tracker/presentation/cubits/symbols/symbols_cubit.dart';
import 'package:price_tracker/features/tracker/presentation/cubits/ticks/ticks_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    ic.sl<WebSocketHelper>().disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ic.sl<SymbolsCubit>()..getActiveSymbols(),
        ),
        BlocProvider(
          create: (context) => ic.sl<TicksCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Price Tracker',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}