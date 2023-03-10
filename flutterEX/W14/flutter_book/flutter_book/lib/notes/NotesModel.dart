import "../BaseModel.dart";

/// A class representing this PIM entity type.
class Note {

  /// The fields this entity type contains.
  int id = -1;
  String title = "";
  String content = "";
  String color = "";

  /// Just for debugging, so we get something useful in the console.
  String toString() {
    return "{ id=$id, title=$title, content=$content, color=$color }";
  }
} /* End class. */


class NotesModel extends BaseModel {
  /// The color.  Needed to be able to display what the user picks in the Text widget on the entry screen.
  String ? color;

  void setColor(String inColor) {
    print("## NotesModel.setColor(): inColor = $inColor");

    color = inColor;
    notifyListeners();
  } /* End setColor(). */
} /* End class. */

// The one and only instance of this model.
NotesModel notesModel = NotesModel();
