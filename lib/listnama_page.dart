import 'package:flutter/material.dart';
import 'package:sqflite_projects/database_helper.dart';
import 'package:sqflite_projects/database_model.dart';

class ListNamaPage extends StatefulWidget {
  const ListNamaPage({Key? key, required this.id, required this.nama}) : super(key: key);
  final int id;
  final String nama;

  @override
  State<ListNamaPage> createState() => _ListNamaPageState();
}

class _ListNamaPageState extends State<ListNamaPage> {
  DatabaseModel? databaseModel;
  DatabaseHelper? databaseHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'list nama'
        ),
      ),
      body: ListView.builder(
        itemCount: databaseModel?.nama?.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){},
              child: Column(
                children: [
                  Card(
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 0.1))
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.nama.toString(), style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
