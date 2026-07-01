import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  
  double temp = 0; 

  @override
  void initState(){
    super.initState();
    getCurrentWeather();
  }
  
 Future getCurrentWeather() async {
  try {
    String cityName ='London';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=a8671e99d9179d7e4dea117631656d81',
      ),
    );

   final data = jsonDecode(res.body);

   if(data['cod'] != '200'){
    throw 'An unexpected error occurred';
   }

   setState( () {
   temp = data['list'][0]['main']['temp'];
   });
 } catch(e){
      throw e.toString();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          )
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh),
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //it makes every things to start from left side
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                
                child: ClipRRect(
                  
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                        Text(
                          '$temp°',
                        style: const TextStyle(
                          fontSize:38,
                          fontWeight: FontWeight.bold,
                         ),
                        ),
                        const SizedBox(height: 12),
                        const Icon(
                          Icons.cloud,
                          size: 60,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Rain', 
                          style: TextStyle(
                            fontSize: 24,
                            ),
                          ),
                      ],
                      ),
                    ),
                  ),
                ),
              
              ),
            ),
            const SizedBox(height: 20), //helps in leaving space btw info
            // Weather forecast cards
             const Text(
                'Weather Forecast',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold, 
               ),
              ),
               const SizedBox(height: 14),
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  children: [
                     
                      HourlforecastItem(
                        time: '00:00',
                        icon: Icons.cloud,
                        temperature: '34°',
                      ),
                      HourlforecastItem(
                         time: '07:00',
                        icon: Icons.umbrella,
                        temperature: '31°',
                      ),
                      HourlforecastItem(
                         time: '13:00',
                        icon: Icons.sunny,
                        temperature: '38°',
                      ),
                      HourlforecastItem(
                         time: '18:00',
                        icon: Icons.cloud,
                        temperature: '34°',
                      ),
                      HourlforecastItem(
                         time: '02:00',
                        icon: Icons.umbrella,
                        temperature: '32°',
                      ),
                      HourlforecastItem(
                         time: '10:00',
                        icon: Icons.cloud,
                        temperature: '35°',
                      ),
                   ],
                 ),
               ),
            const SizedBox(height: 20),
           //Additional Information
           const Text(
                'Additional Information',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold, 
               ),
              ),
              const SizedBox(height: 15),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humdity',
                  value: '91',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.5',
                ),
                AdditionalInfoItem(
                  icon: Icons.compress,
                  label: 'Pressure',
                  value: '1000',
                ),              
               ],
              ),
           ],
          ),
      ),
    );
  }
}

