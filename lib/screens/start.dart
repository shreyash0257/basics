import 'package:animate_do/animate_do.dart';
import 'package:basics/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BounceInDown(
              child: Hero(
                tag: 'logo',
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                      ],
                    ),
                    child: Text(
                      'Basics.',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.nunito().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SlideAction(
              borderRadius: 12,
              elevation: 0,
              innerColor: Colors.grey.shade300,
              outerColor: Colors.grey.shade800,
              sliderButtonIcon: const Icon(Icons.navigate_next),
              text: "Let's dive in",
              textStyle: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.grey.shade300,
                fontSize: 20
              ),
              animationDuration: const Duration(milliseconds: 0),
              sliderRotate: false,
              onSubmit: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
