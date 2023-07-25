import 'package:flutter/material.dart';
import 'package:action_slider/action_slider.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/details_screen.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:Padding (
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("HEY MARKET" ,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(height: 10),
              const Text("First Online" ,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text("Market " ,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Our market always Provide fresh from local",
                style: TextStyle(
                  color:Colors.black54,
                  height: 1.4
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/bg.png"),
              ),
              const Spacer(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ActionSlider.standard(
                      width: MediaQuery.of(context).size.width,
                      icon: const Icon(Icons.trending_flat),
                      backgroundColor: Colors.redAccent[100],
                      toggleColor: Colors.white,
                      child: const Text(
                        'SWIPE TO START',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color:Colors.white
                        )
                      ),
                      action: (controller) async {
                        controller.loading(); //starts loading animation
                        await Future.delayed(const Duration(seconds: 1));
                        controller.success(); //starts success animation
                        await Future.delayed(const Duration(seconds: 1));
                        controller.reset(); //resets the slider
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      direction: TextDirection.ltr,
                    ),
                    const SizedBox(height: 20),
                    RichText(
                        text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'HOW TO SUPPORT',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:13,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2
                                  )
                              ),
                              TextSpan(
                                  text: 'LOCAL FARMERS',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize:13,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                      decoration: TextDecoration.underline,
                                  )
                              )
                            ]
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}

