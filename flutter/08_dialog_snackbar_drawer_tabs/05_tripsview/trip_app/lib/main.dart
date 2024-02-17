import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_app/models/city_model.dart';
import 'package:trip_app/routes.dart';
import 'package:trip_app/views/city/city_view.dart';
import 'package:trip_app/views/home/home_view.dart';
import 'package:trip_app/views/not_found/not_found.dart';
import 'package:trip_app/views/trips/trips_view.dart';

void main() {
  runApp(const MyTrip());
}

class MyTrip extends StatelessWidget {
  const MyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeView(),
      // home: City(),
      initialRoute: '/',
      // routes: appRoutes,
      routes: {

        '/' : (context) {
          return HomeView();
        },

        // '/city' : (context) => CityView(),
        
      },
      onGenerateRoute: (settings) {
        // if(settings.name == CityView.routeName){
        //   final City city = settings.arguments as City;
        //   return MaterialPageRoute(builder: (context) => CityView(city: city));
        // } 

        switch(settings.name){

          case CityView.routeName: {
            return MaterialPageRoute(builder: (context) {
              final City city = settings.arguments as City;
              return CityView(city: city);
            });
          }
          case TripsView.routeName: {
            return MaterialPageRoute(builder: (context) => TripsView());
            }
            
          }          
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },
    );
  }
}