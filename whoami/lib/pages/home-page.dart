import 'package:flutter/material.dart';
import 'package:whoami/util/function/open-webpage.dart';
import 'package:whoami/util/glass-navbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(


      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/gradient-bg.png'),
        fit: BoxFit.cover,
      ),
    ),



        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlassNav(),
            ),

            SizedBox(height: 153.6,),

              Padding(
                  padding: const EdgeInsets.fromLTRB(109.2, 0, 0, 0),
                  child: Text(
                    '🌸',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(109.2, 0, 0, 0),
                  child: Text(
                    "hiii, i'm",
                    style: TextStyle(
                      fontSize: 88,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2D1B4E),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 35.4),
                  child: Text(
                    'Semire',
                    style: TextStyle(
                        color: const Color(0xFFFF6B9D),
                        fontSize: 88,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1.08,
                        letterSpacing: -2.64,
                    ),
                                ),
                ),


              ],
            ),

            SizedBox(height: 21.4,),

//aka serenity
            Padding(
              padding: const EdgeInsets.only(left:109),
              child: SizedBox(
                  width: 560,
                  child: Text.rich(
                      TextSpan(
              children: [
                  TextSpan(
                      text: 'aka ',
                      style: TextStyle(
                          color: const Color(0x9E2D1B4E),
                          fontSize: 21.60,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.65,
                      ),
                  ),
                  TextSpan(
                      text: 'Serenity',
                      style: TextStyle(
                          color: const Color(0xFF9B6FF5),
                          fontSize: 21.60,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.65,
                      ),
                  ),
                  TextSpan(
                      text: ' · CS student · professional overthinker · chaos enjoyer',
                      style: TextStyle(
                          color: const Color(0x9E2D1B4E),
                          fontSize: 21.60,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.65,
                      ),
                  ),
              ],
                      ),
                  ),
              ),
            ),

          SizedBox(height: 28,),

//summary badges
Padding(
  padding: const EdgeInsets.only(left: 109),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  
                  children: [
                
                //he/him
                    Container(
                      // height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: ShapeDecoration(
                          color: const Color(0x159B6FF5),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.80,
                                  color: const Color(0x289B6FF5),
                              ),
                              borderRadius: BorderRadius.circular(26843500),
                          ),
                      ),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                  'he/him',
                                  style: TextStyle(
                                      color: const Color(0xFF9B6FF5),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                  ),
                              ),
                          ],
                      ),
                  ),
                
                  //location
                      Container(
                        // height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: ShapeDecoration(
                color: const Color(0x154ECDC4),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.80,
                        color: const Color(0x284ECDC4),
                    ),
                    borderRadius: BorderRadius.circular(26843500),
                ),
                        ),
                        child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        '🇳🇬 Lagos, Nigeria',
                        style: TextStyle(
                            color: const Color(0xFF4ECDC4),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                        ),
                    ),
                ],
                        ),
                    ),
  
                    //university
                          Container(
            // height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: ShapeDecoration(
                color: const Color(0x15FF6B9D),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.80,
                        color: const Color(0x28FF6B9D),
                    ),
                    borderRadius: BorderRadius.circular(26843500),
                ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        'Pan-Atlantic University',
                        style: TextStyle(
                            color: const Color(0xFFFF6B9D),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                        ),
                    ),
                ],
            ),
        ),
  
  //year
  Container(
            // height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: ShapeDecoration(
                color: const Color(0x33FFB347),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.80,
                        color: const Color(0x28FFB347),
                    ),
                    borderRadius: BorderRadius.circular(26843500),
                ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        '1st Year CS',
                        style: TextStyle(
                            color: const Color(0xFFFF9500),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                        ),
                    ),
                ],
            ),
        ),
                  ],
                
                ),
),

  SizedBox(height: 32,),

  Padding(
    padding: const EdgeInsets.only(left: 109),
    child: Row(
      spacing: 12,
      children: [
    
    //github
        SizedBox(
          // width: 105,
          height: 42,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    width: 0.80,
                    color: Colors.white.withValues(alpha: 0.55),
                  )
                  
                ),
                backgroundColor: const Color(0xFFFFFFFF).withValues(alpha: 0.28),
                // foregroundColor: Colors.white,
                elevation: 0,
          
              shadowColor: Color(0x1effb6c1),
            
          
            ),
            onPressed: () => openWebsite(
              'https://github.com/serenebliss0',
            ),
            icon: const Icon(Icons.code, color: Colors.black,),
            label: const Text(
            'GitHub',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
            ),
          
          ),
        ),

            //email
        SizedBox(
          // width: 105,
          height: 42,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    width: 0.80,
                    color: Colors.white.withValues(alpha: 0.55),
                  )
                  
                ),
                backgroundColor: const Color(0xFFFFFFFF).withValues(alpha: 0.28),
                // foregroundColor: Colors.white,
                elevation: 0,
          
              shadowColor: Color(0x1effb6c1),
            
          
            ),
            onPressed: () => openWebsite(
              'mailto:semajayi1234@gmail.com',
            ),
            icon: const Icon(Icons.code, color: Colors.black,),
            label: const Text(
            'Email',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
            ),
          
          ),
        ),

            //linkedin
        SizedBox(
          // width: 105,
          height: 42,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    width: 0.80,
                    color: Colors.white.withValues(alpha: 0.55),
                  )
                  
                ),
                backgroundColor: const Color(0xFFFFFFFF).withValues(alpha: 0.28),
                // foregroundColor: Colors.white,
                elevation: 0,
          
              shadowColor: Color(0x1effb6c1),
            
          
            ),
            onPressed: () => openWebsite(
              'https://www.linkedin.com/in/semire/',
            ),
            icon: const Icon(Icons.code, color: Colors.black,),
            label: const Text(
            'LinkedIn',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
            ),
          
          ),
        ),
      ],
    ),
  ),

  SizedBox(height: 63.97,),

  Padding(
    padding: const EdgeInsets.only(left: 109),
    child: Row(
      spacing: 1,
      children: [
        Icon(Icons.arrow_downward_rounded, color: Color(0xFF2D1B4E).withValues(alpha: 3.5),),
        Text(
          'scroll to explore',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2D1B4E).withValues(alpha: 3.5),
          ),
          
          )
      ],
    ),
  )


          ],//end of column
        ),
      )
    
    );
  }
}