import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_beta/db/draft_data.dart';
import 'package:project_beta/db/table/draft_table.dart';

class PostGetXController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var _categoryList =
      ["topic 1", "topic 2", "topic 3", "topic 4", "topic 5", "topic 6"].obs;

  var _selectedCategory = "topic 1";

  get categoryList => _categoryList;

  set categoryList(value) {
    _categoryList = value;
  }

  get selectedValue => _selectedCategory;

  set selectedValue(value) {
    _selectedCategory = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  saveAsDraft() async {

    var subject = subjectController.value.text;
    var description = descriptionController.value.text;

    var draftModel = DraftModel(
        category: _selectedCategory,
        subject: subject,
        description: description,
        title: "title");

    await DraftDatabase.addDraft(draftModel);
    var data = await DraftDatabase.getAllDrafts();
    print("data : ${data.draftList}");
    return true;
  }
}
