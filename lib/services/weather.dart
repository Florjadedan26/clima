import 'package:climaa/services/networking.dart';
import 'package:climaa/services/location.dart';

const kApiKey = 'e778054a624508542e3cdedfde545807';
const kOpenweathermapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityName(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$kOpenweathermapURL?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLoacationWeather() async {
    Location newlocation = Location();
    await newlocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$kOpenweathermapURL?lat=${newlocation.latitude}&lon=${newlocation.longitude}&appid=$kApiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
