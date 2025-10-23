import 'package:flutter/material.dart';
import 'Page2.dart';
import '../Logic/Dot.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            buildDot(isActive: true),
            const SizedBox(width: 8),
            buildDot(isActive: false),
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
                  "assets/img/page1.png",
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
                  "Easy Time Management",
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
                  "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first",
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2()));
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
            ),

          ],
        ),
      ),
    );
  }
}
