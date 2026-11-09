import 'package:flutter/material.dart';
import 'package:space_app/core/app_color.dart';
import 'package:space_app/models/planets_data.dart';
import 'package:space_app/screens/details_screen.dart';
import 'package:space_app/widgets/arrow_button.dart';
import 'package:space_app/widgets/explore_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  void _goToPage(int page) {
    if (page < 0 || page >= planets.length) return;
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[_index];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/home.png', fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                 
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: planets.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (_, i) => Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(planets[i].image, width: 350),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowButton(
                        buttonIcon: Icons.arrow_back,
                        onPressed: () => _goToPage(_index - 1),
                      ),
                      Text(
                        planet.name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ArrowButton(
                        buttonIcon: Icons.arrow_forward,
                        onPressed: () => _goToPage(_index + 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ExploreButton(
                    title: 'Explore ${planet.name}',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(planet: planet),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}