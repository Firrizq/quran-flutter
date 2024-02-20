import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/ui/home_screen.dart';

class OnBoadringPage extends StatelessWidget {
  const OnBoadringPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Learn quran \n Recite once a day',
                style: GoogleFonts.plusJakartaSans(
                    color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple),
                    child: SvgPicture.asset('assets/svg/splash.svg'),
                  ),
                  Positioned(
                      left: 0,
                      bottom: -30,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, fixedSize: const Size(200, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  child: Text('Get Started', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold),))),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
