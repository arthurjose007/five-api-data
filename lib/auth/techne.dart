import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseTech {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("tech")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("tech").snapshots();
  }

  Future DeleteTechDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("tech")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
