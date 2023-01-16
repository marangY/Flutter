import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "../utils.dart" as utils;
import "TasksModel.dart";

class TasksDBWorker {
  /// Static instance and private constructor, since this is a singleton.
  TasksDBWorker._();
  static final TasksDBWorker db = TasksDBWorker._();
  Database ? _db;

  Future get database async {
    if (_db == null) {
      _db = await init();
    }
    print("## tasks TasksDBWorker.get-database(): _db = $_db");
    return _db;
  } /* End database getter. */

  Future<Database> init() async {
    print("## Tasks TasksDBWorker.init()");

    String path = join(utils.docsDir!.path, "tasks.db");
    print("## tasks TasksDBWorker.init(): path = $path");
    Database db = await openDatabase(path, version : 1, onOpen : (db) { },
        onCreate : (Database inDB, int inVersion) async {
          await inDB.execute(
              "CREATE TABLE IF NOT EXISTS tasks ("
                  "id INTEGER PRIMARY KEY,"
                  "description TEXT,"
                  "dueDate TEXT,"
                  "completed TEXT"
                  ")"
          );
        }
    );
    return db;
  } /* End init(). */

  Task taskFromMap(Map inMap) {
    print("## Tasks TasksDBWorker.taskFromMap(): inMap = $inMap");

    Task task = Task();
    task.id = inMap["id"];
    task.description = inMap["description"];
    task.dueDate = inMap["dueDate"];
    task.completed = inMap["completed"];

    print("## Tasks TasksDBWorker.taskFromMap(): task = $task");

    return task;
  } /* End taskFromMap(); */

  Map<String, dynamic> taskToMap(Task inTask) {
    print("## tasks TasksDBWorker.taskToMap(): inTask = $inTask");

    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = inTask.id;
    map["description"] = inTask.description;
    map["dueDate"] = inTask.dueDate;
    map["completed"] = inTask.completed;

    print("## tasks TasksDBWorker.taskToMap(): map = $map");

    return map;
  } /* End taskToMap(). */

  Future create(Task inTask) async {
    print("## Tasks TasksDBWorker.create(): inTask = $inTask");

    Database db = await database;

    // Get largest current id in the table, plus one, to be the new ID.
    List<Map> rawList = await db.rawQuery("SELECT MAX(id) + 1 AS id FROM tasks");
    int id = -1;
    if (rawList.first["id"] == null) id = 1;
    else id = rawList.first["id"] as int;
    print("task create record : id = $id");

    // Insert into table.
    return await db.rawInsert(
        "INSERT INTO tasks (id, description, dueDate, completed) VALUES (?, ?, ?, ?)",
        [
          id,
          inTask.description,
          inTask.dueDate,
          inTask.completed
        ]
    );
  } /* End create(). */

  Future<Task> get(int inID) async {
    print("## Tasks TasksDBWorker.get(): inID = $inID");

    Database db = await database;
    var rec = await db.query("tasks", where : "id = ?", whereArgs : [ inID ]);

    print("## Tasks TasksDBWorker.get(): rec.first = $rec.first");

    return taskFromMap(rec.first);
  } /* End get(). */

  Future<List> getAll() async {
    print("## Tasks TasksDBWorker.getAll()");

    Database db = await database;
    var recs = await db.query("tasks");
    var list = recs.isNotEmpty ? recs.map((m) => taskFromMap(m)).toList() : [ ];

    print("## Tasks TasksDBWorker.getAll(): list = $list");

    return list;
  } /* End getAll(). */

  Future update(Task inTask) async {
    print("## Tasks TasksDBWorker.update(): inTask = $inTask");

    Database db = await database;
    return await db.update("tasks", taskToMap(inTask), where : "id = ?", whereArgs : [ inTask.id ]);
  } /* End update(). */

  Future delete(int inID) async {
    print("## Taasks TasksDBWorker.delete(): inID = $inID");

    Database db = await database;
    return await db.delete("Tasks", where : "id = ?", whereArgs : [ inID ]);
  } /* End delete(). */
} /* End class. */