abstract class IContactAdapter {
  List<Contact> getContacts();
}

class Contact {}

class ContactsA implements IContactAdapter {
  @override
  List<Contact> getContacts() {
    return [];
  }
}

class ContactsB implements IContactAdapter {
  @override
  List<Contact> getContacts() {
    return [];
  }
}
