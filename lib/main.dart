import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/wather_cuibit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/pages/home_page.dart';

import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp( BlocProvider<WeatherCubit>(create: (context) => WeatherCubit(WeatherService()), child:WeatherApp()));
}

class WeatherApp extends StatelessWidget {
   WeatherApp({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
         return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final themeColor = BlocProvider.of<WeatherCubit>(context).theme==true
        ? BlocProvider.of<WeatherCubit>(context).weatherModel?.getThemeColor()
        : Colors.blue;
        print(themeColor);
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
           primarySwatch:  themeColor
        ),
        home: HomePage(),
      
    );
      
  });
}}
//BlocProvider.of<WeatherCubit>(context).theme == false ? Colors.blue: BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()