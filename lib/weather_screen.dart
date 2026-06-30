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
                   borderRadius: BorderRadius.circular(16),
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
                            fontSize: 24
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
        
            // Additional Info
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