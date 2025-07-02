import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CardDesignPracticeScreen extends StatelessWidget {
  const CardDesignPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8F0), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E8F0),
        elevation: 0,
        title: const Text(
          'Card Design Practice',
          style: TextStyle(
            color: Color(0xFF6B6BFF),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Practice 1: Card design',
              style: TextStyle(
                color: Color(0xFF6B6BFF),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 30),
            
            Center(
              child: _buildYummySmoothiesCard(),
            ),
            
            const SizedBox(height: 50),
            
            const Text(
              'Practice 2: Card design',
              style: TextStyle(
                color: Color(0xFF6B6BFF),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 30),
            
            Center(
              child: _buildPizzaCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYummySmoothiesCard() {
    return Container(
      width: 280,
      height: 380,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFB85450), 
                    Color(0xFFE8B4B8), 
                  ],
                ),
              ),
              child: Stack(
                children: [

                  const Positioned(
                    top: 30,
                    left: 30,
                    child: Text(
                      'Yummy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  

                  Positioned(
                    top: 100,
                    right: 25,
                    child: RotatedBox(
                      quarterTurns: 1, 
                      child: const Text(
                        'Smoothies',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  

                  Positioned(
                    top: 100,
                    left: 50,
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F5DC),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 45,
                                left: 50,
                                child: Container(
                                  width: 30,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4A460), 
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 42,
                                left: 75,
                                child: Text(
                                  '❤️',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                              const Positioned(
                                top: 48,
                                left: 82,
                                child: Text(
                                  '❤️',
                                  style: TextStyle(fontSize: 6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom light section
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: const Color(0xFFE8E8F0), // Light lavender
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dessert',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '16 places',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPizzaCard() {
    return Container(
      width: 450,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(0), 
        color: const Color(0xFFF8F0F8), 
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2F2F2F), 
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            
            const SizedBox(width: 16),
            
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made this delicious pizza this morning',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '10 mins ago',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}