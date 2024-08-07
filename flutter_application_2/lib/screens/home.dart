import 'package:flutter_application_2/ui/helper/color_helper.dart';
import 'package:flutter_application_2/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:weather_pack/weather_pack.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

void locationServices() async {
  const api = 'f8d70d20552aed7327f745a2cc6f02ca'; // TODO: change to your Openweathermap APIkey
  final gService = GeocodingService(api);

  final List<PlaceGeocode> places = await gService.getLocationByCoordinates(
      latitude: 52.374, longitude: 4.88969);

  print(places);
}

Future<void> weather() async {
  const api = 'f8d70d20552aed7327f745a2cc6f02ca'; // TODO: change to your Openweathermap APIkey
  final wService = WeatherService(api);

  // get the current weather in Amsterdam
  final WeatherCurrent currently = await wService.currentWeatherByLocation(
      latitude: 52.374, longitude: 4.88969);
  
  print(currently);
}

class _MyHomePageState extends State<MyHomePage> {

  @override

  void initState()
  {
  super.initState();
  weather();//call it over here
  locationServices();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      body: Center
      (
        child: Container
        (
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration
          (
            gradient: UIGradientHelper.GradientBG
          ),
          child: Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
                //Text("asd", style: UITextStyles.weatherTextStyle),
                //const Text("asd")
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height*0.4,
                  color: Colors.red,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height*0.2,
                  color: Colors.green,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height*0.4,
                  color: Colors.blue,
                ),
            ],
          ),
        )
      )
    );
  }
}