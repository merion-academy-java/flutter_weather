import 'package:flutter/foundation.dart';
import 'package:flutter_weather/api/dadata/dto/city_response.dart';
import 'package:flutter_weather/api/dadata/dto/suggestions_response.dart';
import 'package:flutter_weather/api/dadata/fetch/fetch_city.dart';
import 'package:flutter_weather/api/weather/dto/weather_response.dart';
import 'package:flutter_weather/api/weather/fetch/fetch_weather_astronomy.dart';
import 'package:flutter_weather/state/view_type.dart';

class WeatherState extends ChangeNotifier {
  CityResponse? cityResponse;
  WeatherResponse? weatherResponse;
  ViewType viewType = ViewType.today;
  bool isLoading = false;
  List<CityResponse> searchResponse = [];

  void init() async {
    isLoading = true;
    notifyListeners();

    SuggestionsResponse suggestionsResponse = await fetchCity("Moscow");
    if (suggestionsResponse.suggestions.isNotEmpty) {
      setCity(suggestionsResponse.suggestions[0]);
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  void citySearch(String q) async {
    SuggestionsResponse suggestionsResponse = await fetchCity(q);
    searchResponse = suggestionsResponse.suggestions;
    notifyListeners();
  }

  void setCity(CityResponse cityResponse) async {
    this.cityResponse = cityResponse;
    loadWeatherData();
  }

  void loadWeatherData() async {
    if (cityResponse == null) {
      isLoading = false;
      weatherResponse = null;
      notifyListeners();
      return;
    }

    weatherResponse = await fetchWeatherCurrent(cityResponse!.city);
    isLoading = false;
    notifyListeners();
  }
}
