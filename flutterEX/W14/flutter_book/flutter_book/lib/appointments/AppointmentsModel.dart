import "../BaseModel.dart";

class Appointment {
  /// The fields this entity type contains.
  int id = -1;
  String title = "";
  String description = "";
  String apptDate = ""; // YYYY,MM,DD
  String apptTime = ""; // HH,MM

  /// Just for debugging, so we get something useful in the console.
  String toString() {
    return "{ id=$id, title=$title, description=$description, apptDate=$apptDate, apptDate=$apptTime }";
  }
} /* End class. */

class AppointmentsModel extends BaseModel {
  /// The appointment time.  Needed to be able to display what the user picks in the Text widget on the entry screen.
  String apptTime = "";

  void setApptTime(String inApptTime) {
    apptTime = inApptTime;
    notifyListeners();
  } /* End setApptTime(). */
} /* End class. */

// The one and only instance of this model.
AppointmentsModel appointmentsModel = AppointmentsModel();
