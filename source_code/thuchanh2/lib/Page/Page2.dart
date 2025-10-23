import 'package:flutter/material.dart';
import '../Logic/Dot.dart';
import 'Page3.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            buildDot(isActive: false),
            const SizedBox(width: 8),
            buildDot(isActive: true),
            const SizedBox(width: 8),
            buildDot(isActive: false),

            Padding(
              padding: const EdgeInsets.fromLTRB(300, 0, 0, 0),
              child: Container(
                child: const Text(
                    "skip",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: Container(
                child: Image.asset(
                  "assets/img/page2.png",
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                child: Text(
                  "Increase Work Effectiveness",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Time management and the determination of more important tasks will give your job statistics better and always improve",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Container(
                height: 50,
                width: 380,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0 ,0, 0),
                      child: Container(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Page3()));
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
