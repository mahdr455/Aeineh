import 'package:flutter/material.dart';
import 'skin_analysis_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              const Column(
                children: [
                  Text(
                    'آینه',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEC407A),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'آرایشگر هوشمند تو',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5D4037),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const Spacer(),

              // Main Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.camera_alt, size: 24),
                      label: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'آنالیز پوست و صورت',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SkinAnalysisScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEC407A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.spa, size: 24),
                      label: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'مشاهده پیشنهادات',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        // TODO: Navigate to recommendations
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5D4037),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Features Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Text(
                      'ویژگی‌های آینه',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FeatureItem(
                          icon: Icons.face_retouching_natural,
                          title: 'تشخیص پوست',
                        ),
                        FeatureItem(
                          icon: Icons.style,
                          title: 'پیشنهاد استایل',
                        ),
                        FeatureItem(
                          icon: Icons.psychology,
                          title: 'مشاوره هوشمند',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEC407A).withOpacity(0.1),
          radius: 28,
          child: Icon(
            icon,
            color: const Color(0xFFEC407A),
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF5D4037),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
