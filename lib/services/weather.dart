import 'package:climatakt/services/location.dart';
import 'package:climatakt/services/networking.dart';
import 'package:climatakt/key.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkhelper = NetworkHelper(
        url: '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getcurrentlocation();
    NetworkHelper networkhelper = NetworkHelper(
        url:
            '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkhelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 35) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 25) {
      return 'Time for shorts and ๐';
    } else if (temp > 20) {
      return 'Time to make a โ';
    } else if (temp > 15) {
      return 'Getting really chilly ๐ท';
    } else if (temp > 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
