import 'package:boiler_control/bloc/home_page/home_page_cubit.dart';
import 'package:boiler_control/bloc/home_page/home_page_state.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageCubit homePageCubit = HomePageCubit();

  @override
  void initState() {
    super.initState();
    homePageCubit.mqttConnect();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      bloc: homePageCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("test"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Icon(Icons.settings, color: state.isConnected ? Colors.green : Colors.red),
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){ homePageCubit.incrementCounter(); },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}