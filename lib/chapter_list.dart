import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chapter_list_controller.dart';
import 'sliding_button.dart';
import 'subtopics.dart';

class ChapterList extends StatelessWidget {
  final String subject;
  final List<String> chapters;
  final List<List<String>> subtopics;
  final ChapterListController controller;

  const ChapterList({
    required this.subject,
    required this.chapters,
    required this.subtopics,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          subject,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ChapterListController>(
        // Use GetBuilder instead of Obx
        init: controller,
        builder: (_) => Container(
          color: Colors.black,
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (BuildContext context, int index) {
              bool allOn = _
                  .areAllSwitchesOn(index); // Access controller methods using _
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExpansionTile(
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.white),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Text(
                            chapters[index].toUpperCase(),
                            style: TextStyle(
                              color: allOn ? Colors.green : Colors.white,
                              fontSize: 14,
                              decoration: allOn
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: Colors.green,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow("Lectures", index, 0),
                            SizedBox(height: 20.0),
                            _buildRow("Notes", index, 1),
                            SizedBox(height: 20.0),
                            _buildRow("Questions", index, 2),
                            SizedBox(height: 20.0),
                            _buildRow("Text", index, 3),
                            SizedBox(height: 25.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubtopicsPage(
                                        chapterName: chapters[index],
                                        subtopics: subtopics[index],
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 70.0, vertical: 15.0),
                                ),
                                child: Text(
                                  'Check Subtopics',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, int chapterIndex, int rowIndex) {
    return GetBuilder<ChapterListController>(
      // Use GetBuilder instead of Obx
      builder: (_) => Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          SlidingButton(
            isOn: _.switchStates[chapterIndex][rowIndex]
                .value, // Access controller variables using _
            onToggle: () {
              _.toggleSwitch(
                  chapterIndex, rowIndex); // Access controller methods using _
            },
          ),
        ],
      ),
    );
  }
}
