import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/api/dadata/dto/city_response.dart';
import 'package:flutter_weather/api/weather/dto/forecastday_response.dart';
import 'package:flutter_weather/api/weather/dto/weather_response.dart';
import 'package:flutter_weather/api/weather/fetch/fetch_weather_astronomy.dart';
import 'package:flutter_weather/commons/colors.dart';
import 'package:flutter_weather/components/astronomy_widget.dart';
import 'package:flutter_weather/components/chance_of_rain_widget.dart';
import 'package:flutter_weather/components/city_search_item_widget.dart';
import 'package:flutter_weather/components/day_forecast_widget.dart';
import 'package:flutter_weather/components/day_summary_widget.dart';
import 'package:flutter_weather/components/hourly_forecast_widget.dart';
import 'package:flutter_weather/components/main_temp_widget.dart';
import 'package:flutter_weather/components/navigation_buttons_widget.dart';
import 'package:flutter_weather/components/search_widget.dart';
import 'package:flutter_weather/pages/search_page.dart';

enum MainPageView { today, tomorrow, nextWeek, search }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageView currentView = MainPageView.today;
  CityResponse currentCity = CityResponse(value: "Москва", city: "Москва");

  Future<WeatherResponse>? weatherData;

  void _onCityChanged(CityResponse cityResponse) {
    setState(() {
      currentCity = cityResponse;
      currentView = MainPageView.today;
      weatherData = fetchWeatherCurrent(currentCity.city);
    });
  }

  @override
  void initState() {
    super.initState();
    weatherData = fetchWeatherCurrent(currentCity.city);
  }

  @override
  Widget build(BuildContext context) {
    late Widget content;

    if (currentView == MainPageView.today) {
      content = today();
    } else if (currentView == MainPageView.tomorrow) {
      content = tomorrow();
    } else if (currentView == MainPageView.nextWeek) {
      content = nextWeek();
    } else {
      content = SearchPage(
        onChanged: _onCityChanged,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeatherColors.main,
        title: Text(currentCity.value),
        actions: [
          IconButton(
              onPressed: () {
                if (currentView == MainPageView.search) {
                  switchView(MainPageView.today);
                } else {
                  switchView(MainPageView.search);
                }
              },
              icon: currentView == MainPageView.search
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: content,
      ),
    );
  }

  void switchView(MainPageView view) {
    setState(() {
      currentView = view;
    });
  }

  Widget today() {
    return FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == false) {
            return Container(
                color: WeatherColors.second,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          WeatherResponse weatherResponse = snapshot.data!;

          return Container(
              color: WeatherColors.second,
              child: ListView(
                children: [
                  MainTempWidget(tempC: weatherResponse.current!.tempC!.toInt(), feelLikeTempC: weatherResponse.current!.feelslikeC!.toInt(),),
                  NavigationButtonsWidget(
                      onTap: switchView, current: currentView),
                  AstronomyWidget(astroResponse: weatherResponse.forecast!.forecastday![0].astro!),
                  HourlyForecastWidget(forecastdayResponse: weatherResponse.forecast!.forecastday![0],),
                  DayForecastWidget(hours: weatherResponse.forecast!.forecastday![0].hour!,),
                  ChangeOfRainWidget(hours: weatherResponse.forecast!.forecastday![0].hour!),
                ],
              ));
        });
  }

  Widget tomorrow() {
    return FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == false) {
            return Container(
                color: WeatherColors.second,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          WeatherResponse weatherResponse = snapshot.data!;

          int tempC = weatherResponse.forecast!.forecastday![1].day!.avgtempC!.toInt();
          int feelLikeTemC = weatherResponse.forecast!.forecastday![1].day!.maxtempC!.toInt();

          return Container(
              color: WeatherColors.second,
              child: ListView(
                children: [
                  MainTempWidget(tempC: tempC, feelLikeTempC: feelLikeTemC,),
                  NavigationButtonsWidget(
                      onTap: switchView, current: currentView),
                  AstronomyWidget(astroResponse: weatherResponse.forecast!.forecastday![1].astro!),
                  HourlyForecastWidget(forecastdayResponse: weatherResponse.forecast!.forecastday![1],),
                  DayForecastWidget(hours: weatherResponse.forecast!.forecastday![1].hour!,),
                  ChangeOfRainWidget(hours: weatherResponse.forecast!.forecastday![1].hour!),
                ],
              ));
        });
  }

  Widget nextWeek() {
    return FutureBuilder(
        future: weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              snapshot.hasData == false) {
            return Container(
                color: WeatherColors.second,
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          WeatherResponse weatherResponse = snapshot.data!;

          List<Widget> content = [];
          content.add(MainTempWidget(tempC: weatherResponse.current!.tempC!.toInt(), feelLikeTempC: weatherResponse.current!.feelslikeC!.toInt(),));
          content.add(NavigationButtonsWidget(
          onTap: switchView, current: currentView));

          for(ForecastdayResponse forecastdayResponse in weatherResponse.forecast!.forecastday!){
            content.add(DaySummaryWidget(forecastdayResponse: forecastdayResponse,));
          }

          return Container(
              color: WeatherColors.second,
              child: ListView(
                children: content,
              ));
        });
  }
}
