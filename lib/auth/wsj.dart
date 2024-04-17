import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseWsj {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("wsj")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("wsj").snapshots();
  }

  Future DeleteWsjDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("wsj")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
