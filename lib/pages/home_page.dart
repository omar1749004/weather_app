import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/wather_cuibit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/searche_page.dart';


class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  
                );
              }));
            },
            icon: Icon(Icons.search),
          )
        ],
        title: Text('Weather App'),
      ),
       body: BlocConsumer<WeatherCubit,WeatherState>(builder: (context,state)
       {
            if(state is WeatherLoading)
        {
          return Center(child: CircularProgressIndicator(),);
        }
         else if(state is WeatherSuccess)
        {
          
          return  ShowWeather(weather: BlocProvider.of<WeatherCubit>(context).weatherModel);
              
        }
        else if(state is WeatherFailure)
        {
          return Center(child: Text("Some thing problem please try agine"),);
        }else {
          return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
        }
       },
       listener: (context,state){
        if(state is WeatherSuccess)
        {
          BlocProvider.of<WeatherCubit>(context).theme =true;
        }
       },
       ),
         
      
    );
  }
}

class ShowWeather extends StatelessWidget {
  const ShowWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
       weather!.getThemeColor(),
        weather!.getThemeColor()[300]!,
        weather!.getThemeColor()[100]!

        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Spacer(flex: 1,),
            Text(
              "${BlocProvider.of<WeatherCubit>(context).cityName}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("Ubdate ${weather!.date.hour}: ${weather!.date.minute}"),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weather!.getImage()),
                
                Text(
                  "${weather!.avTemp.toInt()}",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text("max Temp : ${weather!.maxTemp.toInt()}"),
                    Text("min Temp : ${weather!.minTemp.toInt()}")
                  ],
                )
              ],
            ),
            Spacer(),
            Text(
              weather!.weatherStateName ,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 3,),
          ],
        ),
      );
  }
}
