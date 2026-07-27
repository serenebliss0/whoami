import 'package:flutter/material.dart';

class MobileUnavailable extends StatelessWidget {
  const MobileUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        //gradient bg
      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/gradient-bg-mobile.png'),
        fit: BoxFit.cover,
      ),
    ),

  //card
      child: Center(
        child: Container(
            width: 329.72,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: ShapeDecoration(
          color: Colors.white.withValues(alpha: 0.28),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.03,
                  color: Colors.white.withValues(alpha: 0.65),
              ),
              borderRadius: BorderRadius.circular(28),
          ),
          shadows: [
              BoxShadow(
                  color: Color(0x2DFFB6C1),
                  blurRadius: 56,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
              )
          ],
            ),
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [

              Container(
                  // width: 131.40,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Container(
                              width: double.infinity,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Text(
                                          'WHOAMI',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0x662D1B4E),
                                              fontSize: 11,
                                              fontFamily: 'Cousine',
                                              fontWeight: FontWeight.w700,
                                              height: 1.50,
                                              letterSpacing: 1.10,
                                          ),
                                      ),
                                  ],
                              ),
                          ),
                              Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //desktop only text

                                  Center(
                                    // width: double.infinity,
                                    child: Text(
                                      'desktop-only',
                                      style: const TextStyle(
                                        color: Color(0xFF2D1B4E),
                                        fontSize: 22,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 1.25,
                                        letterSpacing: -0.44,
                                      ),
                                    ),
                                  ),


                                      Container(
                                          width: double.infinity,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                  Text(
                                                      'for now 🌸',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: const Color(0xFFFF6B9D),
                                                          fontSize: 22,
                                                          fontFamily: 'Inter',
                                                          fontWeight: FontWeight.w700,
                                                          height: 1.25,
                                                          letterSpacing: -0.44,
                                                      ),
                                                  ),
                                              ],
                                          ),
                                      ),
                                  ],
                              ),

                      ],
                  ),
              ),
              
              //gradient bar
              Container(
                  width: 63.99,
                  height: 1.99,
                  decoration: ShapeDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0.00, 0.50),
                          end: Alignment(1.00, 0.50),
                          colors: [const Color(0xFFFF6B9D), const Color(0xFF9B6FF5)],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34492500),
                      ),
                  ),
              ),

//text info
              SizedBox(
                  width: 264,
                  child: Text(
                      'this website is still being assembled by one sleep-deprived computer science student.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0x9E2D1B4E),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.75,
                      ),
                  ),
              ),

              Center(
                child: Text(
                    'please come back with a wider screen 🌸',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0x9E2D1B4E),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.75,
                    ),
                ),
              ),
              
              //minimum size pill
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                      color: const Color(0x19FF6B9D),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.03,
                              color: const Color(0x33FF6B9D),
                          ),
                          borderRadius: BorderRadius.circular(34492500),
                      ),
                  ),

                  //min size recommendations
                  child: 
                          Text(
                              'recommend: ≥ 768px wide',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xFFFF6B9D),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                              ),
                          ),

              ),
          ],
            ), //end of column
        ),


      ),

    ),

    );
  }
}