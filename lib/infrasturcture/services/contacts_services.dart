import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactServices {
  // final defaultHelplines = [
  //   {'name': 'Rescue Helpline', 'phone': '1122'},
  //   {'name': 'Edhi Ambulance Helpline', 'phone': '115'},
  //   {'name': 'Rangers Helpline', 'phone': '1101'},
  //   {'name': 'Police Madadgar Helpline', 'phone': '15'},
  //   {'name': 'Fire Brigade Helpline', 'phone': '16'},
  // ];


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

  // Future<void> addDefaultHelplinesToFirestore() async {
  //   try {
  //     for (final helpline in defaultHelplines) {
  //       final contact = Contact(
  //         displayName: helpline['name'],
  //         phones: [Item(label: 'mobile', value: helpline['phone'])],
  //       );
  //       await addContactToFirestore(contact);
  //     }
  //     print('Default helplines added to Firestore');
  //   } catch (e) {
  //     print('Error adding default helplines to Firestore: $e');
  //   }
  // }
  Future<List<String>> getEmergencyNumbers() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('contacts')
          .get();

      final emergencyNumbers = snapshot.docs
          .map((doc) => doc.data()['phone'] as String)
          .toList();

      return emergencyNumbers;
    } catch (e) {
      print('Error retrieving emergency numbers from Firestore: $e');
      return [];
    }
  }

}
