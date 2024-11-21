import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/cubites/get_weather_cubit/get_weather_states.dart';

class InfoView extends StatelessWidget {
  const InfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var weatherModel = BlocProvider.of<getWeatherCubit>(context).weatherModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1B1B4C),
        title: const Text(
          'About Today',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<getWeatherCubit, weatherState>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            var weatherModel = state.weatherModel;
            return Container(
              color: const Color(0xff1B1B4C),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    // city name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 33,
                          color: Colors.orangeAccent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          weatherModel.cityName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    // updated at
                    Text(
                      'Updated at',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    // date updated
                    Text(
                      weatherModel.date.hour.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Image.asset(
                      'assets/27.png',
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weatherModel.temp.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 70,
                          ),
                        ),
                        const Text(
                          '°',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 70,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      weatherModel.weatherCondition,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'MaxTemp : ${weatherModel.maxTemp}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'MinTemp : ${weatherModel.minTemp}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherFailurState) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

DateTime StringToDateTime(String value) {
  return DateTime.parse(value);
}
