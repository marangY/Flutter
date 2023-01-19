import "../BaseModel.dart";

class Contact {
  /// The fields this entity type contains.
  int id = -1;
  String name = "";
  String phone = "";
  String email = "";
  String birthday = ""; // YYYY,MM,DD

  /// Just for debugging, so we get something useful in the console.
  String toString() {
    return "{ id=$id, name=$name, phone=$phone, email=$email, birthday=$birthday }";
  }
} /* End class. */

class ContactsModel extends BaseModel {
  /// "Force" a rebuild of the entry page (when selecting an avatar image).
  void triggerRebuild() {

    print("## ContactsModel.triggerRebuild()");

    notifyListeners();
  } /* End triggerRebuild(). */
} /* End class. */

// The one and only instance of this model.
ContactsModel contactsModel = ContactsModel();
