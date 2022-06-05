
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class studentPrefData {

  Future<String> get_doc_id() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _doc_id = prefs.getString('doc_id').toString();
    return _doc_id;

  }

  Future set_doc_id(String doc_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('doc_id', doc_id);
  }

  Future clear_data() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}