import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherService
{
  String apiKay ="28fca51fd4484cfd94491506233004";
  String baseUrl ="http://api.weatherapi.com/v1";
  Future<WeatherModel> getWeather ({required String cityName})async
  {
    Uri uri = Uri.parse(
    "$baseUrl/forecast.json?key=$apiKay&q=$cityName&days=7");
    
    http.Response response= await http.get(uri);
     
    Map<String ,dynamic> data =jsonDecode(response.body);
    WeatherModel weatherModel= WeatherModel.fromJson(data);
      

    // String date =data["location"]['localtime'];
    // String icon =data['forecast']['forecastday'][0]['day']['condition']['icon'];
    // String aveTemp =data['forecast']['forecastday'][0]['day']['avgtemp_c'];
    return weatherModel;
  }
}
//http://api.weatherapi.com/v1/forecast.json?key=$28fca51fd4484cfd94491506233004&q=$londone&days=7