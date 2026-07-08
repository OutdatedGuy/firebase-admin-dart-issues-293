import 'package:firebase_admin_sdk/auth.dart';
import 'package:firebase_admin_sdk/firebase_admin_sdk.dart';
import 'package:firebase_functions/firebase_functions.dart';

void main() {
  FirebaseApp.initializeApp();

  runFunctions((firebase) {
    firebase.https.onRequest(name: 'helloWorld', (request) async {
      const phoneNumber = '+919999999999';

      final auth = FirebaseApp.instance.auth();
      try {
        final userRecord = await auth.createUser(
          CreateRequest(phoneNumber: phoneNumber),
        );
        print('User record: ${userRecord.toJson()}');
      } catch (e) {
        print('Error fetching user by phone number: $e');
      }

      return Response.ok('Hello from Firebase Functions!');
    });
  });
}
