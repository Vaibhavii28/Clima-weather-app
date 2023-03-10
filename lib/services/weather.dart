
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '8237fadb4980e5c236bb7ceafe85b1a6';
const openWeatherMapURl = 'https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURl?q=$cityName&appid=$apiKey&units=metric');

    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationweather() async{
    Location location = Location();
    await location
        .getCurrentLocation(); // Keyword future is used in location.dart because async can return the type of future


    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

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
