import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();

    // Navigate to next screen after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        // Replace with your main app route
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF87CEEB), // Sky blue
              Color(0xFF98FB98), // Pale green
              Color(0xFF90EE90), // Light green
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top section with clouds
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    // Animated clouds
                    Positioned(
                      top: 50,
                      left: 20,
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(50 * _animationController.value, 0),
                            child: const CloudWidget(size: 60),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: 30,
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(-30 * _animationController.value, 0),
                            child: const CloudWidget(size: 40),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Center section with logo and birds
              Expanded(
                flex: 3,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Main logo/icon
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.pets,
                                size: 60,
                                color: Color(0xFF4CAF50),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Flying birds animation
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(
                                        20 *
                                            _animationController.value *
                                            (index + 1),
                                        -10 * _animationController.value,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: BirdWidget(
                                          delay: index * 0.2,
                                          controller: _animationController,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bottom section with app name and tagline
              Expanded(
                flex: 2,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'BIRD FARM',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Kelola Ternak Burung Anda',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Loading indicator
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom cloud widget
class CloudWidget extends StatelessWidget {
  final double size;

  const CloudWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.6,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Stack(
        children: [
          Positioned(
            left: size * 0.2,
            top: size * 0.1,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: size * 0.2,
            top: size * 0.1,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom bird widget with animation
class BirdWidget extends StatelessWidget {
  final double delay;
  final AnimationController controller;

  const BirdWidget({Key? key, required this.delay, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = (controller.value - delay).clamp(0.0, 1.0);
        return Transform.rotate(
          angle: value * 0.2,
          child: Icon(
            Icons.flight,
            size: 24,
            color: Colors.white.withOpacity(0.8 + 0.2 * value),
          ),
        );
      },
    );
  }
}
