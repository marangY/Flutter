import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "NotesDBWorker.dart";
import "NotesModel.dart" show Note, NotesModel, notesModel;

class NotesList extends StatelessWidget {
  Widget build(BuildContext inContext) {
    print("## NotesList.build()");
    return ScopedModel<NotesModel>(
        model : notesModel,
        child : ScopedModelDescendant<NotesModel>(
            builder : (BuildContext inContext, Widget? inChild, NotesModel inModel) {
              return Scaffold(
                // Add note.
                  floatingActionButton : FloatingActionButton(
                      child : Icon(Icons.add, color : Colors.white),
                      onPressed : () async {
                        notesModel.entityBeingEdited = Note();
                        notesModel.setColor("white");
                        notesModel.setStackIndex(1);
                      }
                  ),
                  body : ListView.builder(
                      itemCount : notesModel.entityList.length,
                      itemBuilder : (BuildContext inBuildContext, int inIndex) {
                        Note note = notesModel.entityList[inIndex];
                        // Determine note background color (default to white if none was selected).
                        Color color = Colors.white;
                        switch (note.color) {
                          case "red" : color = Colors.red; break;
                          case "green" : color = Colors.green; break;
                          case "blue" : color = Colors.blue; break;
                          case "yellow" : color = Colors.yellow; break;
                          case "grey" : color = Colors.grey; break;
                          case "purple" : color = Colors.purple; break;
                        }
                        return Container(
                            padding : EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child : Slidable(
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.25,
                                children: [
                                  SlidableAction(
                                    label: "Delete",
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    onPressed: (inContext) => _deleteNote(inContext, note),
                                  ),
                                ],
                              ),
                              child : Card(
                                elevation : 8,
                                color : color,
                                child : ListTile(
                                    title : Text("${note.title}"),
                                    subtitle : Text("${note.content}"),
                                    // Edit existing note.
                                    onTap : () async {
                                      // Get the data from the database and send to the edit view.
                                      notesModel.entityBeingEdited = await NotesDBWorker.db.get(note.id);
                                      notesModel.setColor(notesModel.entityBeingEdited.color);
                                      notesModel.setStackIndex(1);
                                    }
                                )
                              ),
                            ), /* End Slidable. */
                        ); /* End Container. */
                      } /* End itemBuilder. */
                  ) /* End End ListView.builder. */
              ); /* End Scaffold. */
            } /* End ScopedModelDescendant builder. */
        ) /* End ScopedModelDescendant. */
    ); /* End ScopedModel. */

  } /* End build(). */

  Future _deleteNote(BuildContext inContext, Note inNote) async {
    print("## NotestList._deleteNote(): inNote = $inNote");

    return showDialog(
        context : inContext,
        barrierDismissible : false,
        builder : (BuildContext inAlertContext) {
          return AlertDialog(
              title : Text("Delete Note"),
              content : Text("Are you sure you want to delete ${inNote.title}?"),
              actions : [
                TextButton(child : Text("Cancel"),
                    onPressed: () {
                      // Just hide dialog.
                      Navigator.of(inAlertContext).pop();
                    }
                ),
                TextButton(child : Text("Delete"),
                    onPressed : () async {
                      // Delete from database, then hide dialog, show SnackBar, then re-load data for the list.
                      await NotesDBWorker.db.delete(inNote.id);
                      ScaffoldMessenger.of(inAlertContext).showSnackBar(
                          SnackBar(
                              backgroundColor : Colors.red,
                              duration : Duration(seconds : 2),
                              content : Text("Note deleted")
                          )
                      );
                      Navigator.of(inAlertContext).pop();
                      // Reload data from database to update list.
                      notesModel.loadData("notes", NotesDBWorker.db);
                    }
                )
              ]
          );
        }
    );
  } /* End _deleteNote(). */
} /* End class. */
