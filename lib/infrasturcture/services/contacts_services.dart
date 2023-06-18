import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactServices {
  Future<void> addContactToFirestore(Contact contact) async {
    try {
      await FirebaseFirestore.instance
          .collection('contacts')
          .add({
            'name': contact.displayName ?? '',
            'phone': contact.phones?.first.value ?? '',
          })
          .then((value) => print('Contact added to Firestore'))
          .catchError((error) => print('Failed to add contact: $error'));
    } catch (e) {
      print('Error adding contact to Firestore: $e');
    }
  }
}
