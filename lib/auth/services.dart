import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseModel {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("content")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("content").snapshots();
  }

  Future DeleteEmployeeDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("Employe")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
