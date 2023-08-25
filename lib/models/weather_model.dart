import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class WeatherModel
{
   DateTime date;
   String icon;
   String weatherStateName;
   double avTemp;
   double minTemp;
   double maxTemp;

  WeatherModel({required this.date,required this.weatherStateName,required this.icon,required this.avTemp,required this.minTemp,required this.maxTemp});

  factory WeatherModel.fromJson(dynamic data)
  {
    
    var jsData =data['forecast']['forecastday'][0]['day'];
      // date= data["location"]['localtime'];
      // weatherStateName= jsData['condition']['text'];
      // icon=jsData['condition']['icon'];
      // avTemp= jsData['avgtemp_c'];
      // minTemp= jsData['mintemp_c'];
      // maxTemp= jsData['maxtemp_c'];
      return WeatherModel(date:  DateFormat("yyyy-MM-dd HH:mm").parse(data["location"]['localtime']) ,
      weatherStateName: jsData['condition']['text'] ,
      icon: jsData['condition']['icon'], 
      avTemp: jsData['avgtemp_c'], minTemp: jsData['mintemp_c'],
      maxTemp: jsData['maxtemp_c']);
  }
 @override
  String toString() {
    // TODO: implement toString
    return "temp = $avTemp";
  }
  String getImage(){
    if(weatherStateName== "Clear" || weatherStateName =="Light Cloud"){
    return "assets/images/clear.png";
    }else if(weatherStateName =="Sleet" ||
    weatherStateName =="Snow" ||
    weatherStateName =="Hail"){
      return "assets/images/snow.png";
    }
    else if(weatherStateName =="Heavy cloud" ||
    weatherStateName =="Partly cloudy" ){
    return "assets/images/cloudy.png";}
    else if(weatherStateName =="Light rain" ||
    weatherStateName =="Patchy rain possible" ||
    weatherStateName =="Heavy rain" ||
    weatherStateName =="Showers"){
     return "assets/images/rainy.png";
    }
    else if(weatherStateName== "thunderstorm" || weatherStateName =="thunder"){
    return "assets/images/clear.png";
    }
      else{
        return "assets/images/clear.png";
      }
   
  }
  MaterialColor getThemeColor(){
    if(weatherStateName== "Clear" || weatherStateName =="Light Cloud"){
    return Colors.orange;
    }else if(weatherStateName =="Sleet" ||
    weatherStateName =="Snow" ||
    weatherStateName =="Hail"){
      return Colors.blue;
    }
    else if(weatherStateName =="Heavy cloud" ||
    weatherStateName =="Partly cloudy" ){
    return Colors.blue;}
    else if(weatherStateName =="Light rain" ||
    weatherStateName =="Patchy rain possible" ||
    weatherStateName =="Heavy rain" ||
    weatherStateName =="Showers"){
     return Colors.blueGrey;
     
    }
    else if(weatherStateName== "thunderstorm" || weatherStateName =="thunder"){
    return Colors.grey;
    }
      else{
        return Colors.orange;
      }
   
  }
   int gethour(){
    if(date.hour.toInt()>12){
     return  date.hour.toInt()-12;
    }
    else{
       return  date.hour.toInt();
    }
   }
   String checkName(int n)
   {
    if(n ==0)
    {
      return"Please Enter Corcet City Name Please";
      
    }else
    return "s";
   }
}