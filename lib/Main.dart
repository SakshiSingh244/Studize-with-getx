import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chapter_list_controller.dart';
import 'first_page_layout.dart';
import 'chap_name.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JEE Study App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(),
    getPages: [
      GetPage(
        name: '/mathematics',
        page: () => SubjectPage(
          subject: 'Mathematics',
          chapters: mathematicsChapters,
          subtopics: mathematicsSubtopics,
        ),
      ),
      GetPage(
        name: '/physics',
        page: () => SubjectPage(
          subject: 'Physics',
          chapters: physicsChapters,
          subtopics: physicsSubtopics,
        ),
      ),
      GetPage(
        name: '/chemistry',
        page: () => SubjectPage(
          subject: 'Chemistry',
          chapters: chemistryChapters,
          subtopics: chemistrySubtopics,
        ),
      ),
    ],
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Row(
          children: [
            const Text(
              'Syllabus',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
              ),
              child: Text(
                'JEE',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black, size: 18),
                onPressed: () {
                  // Handle search button press
                },
              ),
            ),
          ],
        ),
      ),
      body: FirstPageLayout(),
    );
  }
}
