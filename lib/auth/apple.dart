import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseApple {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("apple")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("apple").snapshots();
  }

  Future deleteAppleDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("apple")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
