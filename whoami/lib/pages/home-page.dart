import 'package:flutter/material.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(109.2, 0, 0, 0),
                  child: Text(
                    "hiii, i'm semire",
                    style: TextStyle(
                      fontSize: 88,
                      fontWeight: FontWeight.w700,
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
            )









          ],//end of column
        ),
      )
    
    );
  }
}