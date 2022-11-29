import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

void Function()? addCompletedAction(String completedActionStamp) {
  return () async {
    await db
        .collection("users")
        .where('accountID', isEqualTo: 123)
        .get()
        .then((snapshot) async {
      QueryDocumentSnapshot doc = snapshot.docs[0];
      DocumentReference docRef = doc.reference;
      await docRef.update({
        'completedActions': FieldValue.arrayUnion([completedActionStamp])
      });
    });
  };
}

void Function()? removeCompletedAction(String completedActionStamp) {
  return () async {
    await db
        .collection("users")
        .where('accountID', isEqualTo: 123)
        .get()
        .then((snapshot) async {
      QueryDocumentSnapshot doc = snapshot.docs[0];
      DocumentReference docRef = doc.reference;
      await docRef.update({
        'completedActions': FieldValue.arrayRemove([completedActionStamp])
      });
    });
  };
}
