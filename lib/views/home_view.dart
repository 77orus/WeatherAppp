import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/no_weather_view.dart';
import 'package:weatherapp/views/search_view.dart';
import 'package:weatherapp/views/weather_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Weather',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                fontSize: 25,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff1B1B4C),
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const searchView();
                }),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<getWeatherCubit, weatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherView();
          } else if (state is WeatherLoadedState) {
            return const InfoView();
          } else {
            return const Text('oops there was an error , please try again');
          }
        },
      ),
    );
  }
}
