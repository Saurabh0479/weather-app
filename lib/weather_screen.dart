import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
                          '30°',
                        style: TextStyle(
                          fontSize:38,
                          fontWeight: FontWeight.bold,
                         ),
                        ),
                        const SizedBox(height: 12),
                        Icon(
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
                     
                      HourlforecastItem(),
                      HourlforecastItem(),
                      HourlforecastItem(),
                      HourlforecastItem(),
                      HourlforecastItem(),
                      HourlforecastItem(),
                   ],
                 ),
               ),
            const Placeholder(
              fallbackHeight: 150,
            ),
            const SizedBox(height: 20),
        
            const Placeholder(
              fallbackHeight: 150,
            ),
          ],
          ),
      ),
    );
  }
}

class HourlforecastItem extends StatelessWidget {
  const HourlforecastItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                        elevation: 6,
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Icon(
                                Icons.cloud,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '34°',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
  }
}