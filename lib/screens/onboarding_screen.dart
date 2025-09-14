import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Onboarding Image (Top Half)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (536 / 812), // Figma height 536 on 812 screen
            child: Image.asset(
              'assets/images/I156_95_417_719.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Bottom Content with Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / 812), // Figma height 360 on 812 screen
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromRGBO(5, 5, 5, 0), // Figma gradient stop 0, alpha 0
                    const Color.fromRGBO(5, 5, 5, 1), // Figma gradient stop 0.2367, rgb(5,5,5) alpha 1
                  ],
                  stops: const [0.0, 0.2367],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Figma padding 24
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Calculate top spacing within the container based on Figma positions
                    // Total content height: 144 (heading) + 8 (gap) + 42 (desc) + 32 (gap) + 56 (button) = 282
                    // Container height: 360. Remaining space = 360 - 282 = 78
                    // This 78px is the top padding of the content inside this container.
                    SizedBox(height: screenHeight * (78 / 812)),

                    // Main Heading
                    Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (32 / 375), // Figma fontSize 32
                        fontWeight: FontWeight.w600, // SemiBold
                        color: Colors.white,
                        letterSpacing: 0.16,
                        height: 1.5, // Figma lineHeightPx 48, fontSize 32 -> 48/32 = 1.5
                      ),
                    ),
                    SizedBox(height: screenHeight * (8 / 812)), // Spacing between texts (Figma 628 - (476+144) = 8)

                    // Description Text
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        fontSize: screenWidth * (14 / 375), // Figma fontSize 14
                        fontWeight: FontWeight.w400, // Regular
                        color: const Color(0xFFA2A2A2), // Figma color r:0.635,g:0.635,b:0.635,a:1
                        letterSpacing: 0.14,
                        height: 1.5, // Figma lineHeightPx 21, fontSize 14 -> 21/14 = 1.5
                      ),
                    ),
                    SizedBox(height: screenHeight * (32 / 812)), // Spacing before button (Figma 702 - (628+42) = 32)

                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight * (56 / 812), // Figma height 56
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/home'); // Navigate to the home screen using go_router
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E), // Figma color r:0.776,g:0.486,b:0.305,a:1
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Figma cornerRadius 16
                          ),
                          padding: EdgeInsets.symmetric(vertical: screenHeight * (16 / 812)), // Figma paddingTop/Bottom 16
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.sora(
                            fontSize: screenWidth * (16 / 375), // Figma fontSize 16
                            fontWeight: FontWeight.w600, // SemiBold
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * (41 / 812)), // Spacing from button to bottom of container (Figma 799 - (702+56) = 41)
                  ],
                ),
              ),
            ),
          ),

          // 3. Status Bar (Time, Wifi, Battery, Mobile Signal)
          Positioned(
            top: screenHeight * (12 / 812), // Figma y:12
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)), // Aligned with content
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41',
                      style: GoogleFonts.sora(
                        color: Colors.white,
                        fontSize: screenWidth * (15 / 375), // Approximate, based on Figma vector bounds
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt, color: Colors.white, size: screenWidth * (17 / 375)), // Approximate icon sizes
                        SizedBox(width: screenWidth * (5 / 375)),
                        Icon(Icons.wifi, color: Colors.white, size: screenWidth * (17 / 375)),
                        SizedBox(width: screenWidth * (5 / 375)),
                        Icon(Icons.battery_full, color: Colors.white, size: screenWidth * (20 / 375)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Home Indicator
          Positioned(
            bottom: screenHeight * (8 / 812), // Figma y:799, height 5. 812 - (799+5) = 8 (bottom margin)
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth * (134 / 375), // Figma width 134
                height: 5, // Figma height 5
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // Figma color for Home Indicator
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}