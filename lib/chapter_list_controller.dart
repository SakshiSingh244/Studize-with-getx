import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jee_prep/chap_name.dart';

class ChapterListController extends GetxController {
  RxList<RxList<RxBool>> switchStates = RxList<RxList<RxBool>>([]);

  @override
  void onInit() {
    super.onInit();
    _loadSwitchStates();
  }

  void toggleSwitch(int chapterIndex, int rowIndex) {
    switchStates[chapterIndex][rowIndex].value =
        !switchStates[chapterIndex][rowIndex].value;
    _saveSwitchStates();
  }

  bool areAllSwitchesOn(int chapterIndex) {
    return switchStates[chapterIndex].every((element) => element.value);
  }

  void _loadSwitchStates() {
    final box = GetStorage();
    if (box.hasData('switchStates')) {
      switchStates.assignAll((box.read('switchStates') as List<dynamic>).map(
          (chapter) => (chapter as List<dynamic>)
              .map((state) => state.toString() == 'true' ? true.obs : false.obs)
              .toList()
              .obs // Ensure each inner list is cast to RxList<RxBool>
          ));
    } else {
      // Initialize with default values (all switches off)
      String subject =
          'Physics'; // Replace with actual logic to determine subject
      int chaptersCount = getNumberOfChapters(subject);
      switchStates.clear();
      for (int i = 0; i < chaptersCount; i++) {
        switchStates.add([false.obs, false.obs, false.obs, false.obs].obs);
      }
    }
  }

  void _saveSwitchStates() {
    final box = GetStorage();
    box.write(
      'switchStates',
      switchStates
          .map((chapter) => chapter.map((state) => state.value).toList())
          .toList(),
    );
  }

  int getNumberOfChapters(String subject) {
    // Implement logic to get the number of chapters based on the subject
    if (subject == 'Physics') {
      return physicsChapters.length;
    } else if (subject == 'Chemistry') {
      return chemistryChapters.length;
    } else if (subject == 'Mathematics') {
      return mathematicsChapters.length;
    } else {
      return 0; 
    }
  }
}
