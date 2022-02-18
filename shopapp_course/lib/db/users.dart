import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _database.reference().child(data["uid"]).set(
          data);
      print("USER WAS CREATED");
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }
}
