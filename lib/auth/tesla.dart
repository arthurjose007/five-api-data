import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseTesla {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("tesla")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("tesla").snapshots();
  }

  Future DeleteTeslaDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("tesla")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
