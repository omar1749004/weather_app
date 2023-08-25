import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/wather_cuibit.dart';
import 'package:weather_app/models/weather_model.dart';


class SearchPage extends StatelessWidget {
  int check =1;
static String id ="SearchPage";
  
  String?  cityName;
 WeatherModel? weatherData;
 SearchPage();
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName =data;
            },
            onSubmitted: (data) async
            {
              cityName =data;
               BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
               BlocProvider.of<WeatherCubit>(context).cityName=cityName;
               BlocProvider.of<WeatherCubit>(context).theme =true;
              Navigator.pop(context);

            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              label: Text("search"),
              suffixIcon: GestureDetector
              (
                
                child: Icon(Icons.search),
              onTap: () {
               BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
               
               BlocProvider.of<WeatherCubit>(context).cityName=cityName;
               Navigator.pop(context);
             
              },
              ),
              border: OutlineInputBorder(),
              hintText: "Enter a City"
            ),
          ),
        ),
      ),
    );
  }
}
