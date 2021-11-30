import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_beta/db/draft_data.dart';
import 'package:project_beta/db/table/draft_table.dart';

class UpdatePostGetXController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late String _selectedId;
  bool _isDataLoaded = false;

  String get selectedId => _selectedId;

  set selectedId(String value) {
    _selectedId = value;
    initSavedDraft();
  }

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

  updateDraft() async {
    var subject = subjectController.value.text;
    var description = descriptionController.value.text;

    var draftModel = DraftModel(
        id: _selectedId,
        category: _selectedCategory,
        subject: subject,
        description: description,
        title: "title");

    await DraftDatabase.updateDraft(draftModel);
    var data = await DraftDatabase.getAllDrafts();
    print("data : ${data.draftList}");
    return true;
  }

  void initSavedDraft() async {

    if (_isDataLoaded) return;

    print("got into initSavedDraft");
    DraftModel? draftModel = await DraftDatabase.getSingleDraft(_selectedId);
    _selectedCategory = draftModel!.category;
    descriptionController.text = draftModel!.description;
    subjectController.text = draftModel!.subject;
    descriptionController.selection = TextSelection.fromPosition(
      TextPosition(offset: descriptionController.text.length),
    );
    subjectController.selection = TextSelection.fromPosition(
      TextPosition(offset: subjectController.text.length),
    );
    _isDataLoaded = true;
  }
}
