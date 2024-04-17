import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseBusiness {
  Future addcomtentdetails(Map<String, dynamic> datacontent, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("business")
          .doc(id)
          .set(datacontent);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Stream<QuerySnapshot>> getemployeeDetails() async {
    return await FirebaseFirestore.instance.collection("business").snapshots();
  }

  Future DeleteBusinessDetails(
    String id,
  ) async {
    try {
      return await FirebaseFirestore.instance
          .collection("business")
          .doc(id)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
