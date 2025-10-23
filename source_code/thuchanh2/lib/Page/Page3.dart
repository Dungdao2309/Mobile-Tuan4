import 'package:flutter/material.dart';
import 'package:thuchanh2/Page/Page1.dart';
import '../Logic/Dot.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            buildDot(isActive: false),
            const SizedBox(width: 8),
            buildDot(isActive: false),
            const SizedBox(width: 8),
            buildDot(isActive: true),

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
                  "assets/img/page3.png",
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
                  "Reminder Notification",
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
                  "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Page1()));
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
