import 'package:flutter/material.dart';
import 'package:sqflite_projects/database_helper.dart';
import 'package:sqflite_projects/database_model.dart';
import 'package:sqflite_projects/listnama_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink ,
      ),
      home: const MyHomepage()
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  DatabaseModel? databaseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: () async {
                  int i = await DatabaseHelper.instance.insert(DatabaseModel(
                    nama: "Muhammad Firdan"
                  ));
                  print('hasil insert id : $i');
                },
                child: Text(
                  'Insert',
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),
                onPressed: () async {
                  List<Map<String, Object?>> queryRows =
                  await DatabaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text(
                  'Get all',
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () async {
                  int updateId = await DatabaseHelper.instance.update(2, DatabaseModel(nama: "Firdan"));
                  print(updateId);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //       return ListNamaPage(id: databaseModel!.id!.toInt(), nama: databaseModel!.nama.toString(),);
                  //     }
                  //     )
                  // );
                },
                child: Text(
                  'Update',
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () async {
                  int rowsEffected = await DatabaseHelper.instance.delete(3);
                  print(rowsEffected);
                },
                child: Text(
                  'Delete',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}