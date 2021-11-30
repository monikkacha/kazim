import 'package:get/get.dart';
import 'package:project_beta/db/draft_data.dart';
import 'package:project_beta/db/table/draft_data.dart';

class DraftGetXController extends GetxController {
  late DraftDataTable _draftDataTable;

  @override
  void onInit() async {
    _draftDataTable = await DraftDatabase.getAllDrafts();
    super.onInit();
  }

  DraftDataTable get draftDataTable => _draftDataTable;

  set draftDataTable(DraftDataTable value) {
    _draftDataTable = value;
  }
}
