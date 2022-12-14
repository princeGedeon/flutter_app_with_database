import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:projet_flutter_sqlite/Models/Class_models/articleitem.dart';
import 'package:projet_flutter_sqlite/Models/Class_models/itemlist.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient{
  //2Tables
  //Tables 1 =>Liste des taches à faires (title,id,status)
  //Table 2 => Liste des objets .(Nom,prix,magazin,image,id_tache,id)
  //INTEGER, TEXT, REAL,
  //INTEGER PRIMARY KEY pour id unique
  // TEXT NOT NULL

  //Accéder à la database
  Database? _database;
  Future<Database> get database async{
    if (_database!=null) return _database!;
    return await createDatabase();
  }

  Future<Database> createDatabase() async{

    Directory directory=await getApplicationDocumentsDirectory();
    final path=join(directory.path,"database.db");

    return await openDatabase(path,version: 1,
    onCreate: onCreate
    );

  }
  onCreate(Database database,int version) async{
    await database.execute('''
      CREATE TABLE Task (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      status TEXT NOT NULL
      )
    
    ''');

    await database.execute('''
      CREATE TABLE Article (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      price REAL,
      shop TEXT,
      image TEXT,
      task INTEGER
      )
    
    ''');
  }


  Future<List<ItemList>> allItems() async{
    Database db=await database;
    const query="SELECT * FROM Task";

    List<Map<String,dynamic>> mapList= await db.rawQuery(query);
    return mapList.map((e) => ItemList.fromJson(e)).toList();
  }

  Future<List<Article>> ariclesFromId(int id) async{
      Database db=await database;
      List<Map<String,dynamic>> mapList=await db.query('Article',where:"task = ?",
      whereArgs: [id]);
      print(mapList);

      return mapList.map((e) => Article.fromJson(e)).toList();


  }

  Future<bool> addItemList (String text) async{
    Database db=await database;

    await db.insert("Task", {

      "title":text,
      "status":"Yo"
    });

    return true;
  }

  Future<bool> removeItem(ItemList item) async{
    Database db=await database;
    await db.delete('Task',where: "id = ?",whereArgs:[item.id]);

    await db.delete("Article",where: "task= ?",whereArgs: [item.id]);
    return true;
  }


  Future<bool> upsert(Article article) async{
    Database db=await database;
    (article.id==null)?
        article.id=await db.insert('Article', article.toJson()):
        await db.update('Article',article.toJson(), where:"id=?",whereArgs: [article.id]);

    return true;

  }



}