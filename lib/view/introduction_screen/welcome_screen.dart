import 'package:cliffhub/core/constants/const.dart';
import 'package:cliffhub/view/login_screen/log_in_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/priscilla-du-preez-7etIYqqw2jU-unsplash (1).jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 350,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Cliffhub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kWhite,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    kContainerSize,
                    const Text(
                      'Connect to the world around  and share \n your thoughts and posts to its cliff. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kWhite),
                    ),
                    kSize,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(color: kBlack),
                        ),
                      ),
                    ),
                    kContainerSize,
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
