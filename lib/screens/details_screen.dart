import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/app_color.dart';
import 'package:space_app/models/planet.dart';
import 'package:space_app/widgets/info_row.dart';
import 'package:space_app/widgets/planet_header.dart';

class DetailsScreen extends StatelessWidget {
  final Planet planet;

  const DetailsScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(

        fit: StackFit.expand,
        children: [
          
          Image.asset(
            'assets/images/planet_details.png',
            
            fit: BoxFit.cover,
          ),

          
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanetHeader(planet: planet),
                Transform.translate(
                   offset: const Offset(0, -60),
                  child: SizedBox(
                    height: 300,
                    child: Flutter3DViewer(src: planet.model),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        planet.about,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      InfoRow(
                        label: 'Distance from Sun',
                        value: '${planet.distanceFromSun} km',
                      ),
                      InfoRow(
                        label: 'Length of Day',
                        value: '${planet.lengthOfDay} hours',
                      ),
                      InfoRow(
                        label: 'Orbital Period',
                        value: '${planet.orbitalPeriod} Earth years',
                      ),
                      InfoRow(label: 'Radius', value: '${planet.radius} km'),
                      InfoRow(label: 'Mass', value: '${planet.mass} kg'),
                      InfoRow(
                        label: 'Gravity',
                        value: '${planet.gravity} m/s²',
                      ),
                      InfoRow(
                        label: 'Surface Area',
                        value: '${planet.surfaceArea} km²',
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}