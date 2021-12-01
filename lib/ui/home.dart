import 'package:flutter/material.dart';
import 'package:crud_sqflite/ui/entryform.dart';
import 'package:crud_sqflite/models/content.dart';
import 'package:crud_sqflite/helpers/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Content> contentList;

  @override
  Widget build(BuildContext context) {
    if (contentList == null) {
      contentList = List<Content>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Content Terbaru'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var content = await navigateToEntryForm(context, null);
          if (content != null) addContent(content);
        },
      ),
    );
  }

  Future<Content> navigateToEntryForm(
      BuildContext context, Content content) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(content);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            //ini untuk tampilan bagian judul
            leading: Image.network(
              this.contentList[index].foto,
              width: 100.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            //ini untuk tampilan bagian foto
            title: Text(
              this.contentList[index].judul,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            subtitle: Text(
              this.contentList[index].deskripsi,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteContent(contentList[index]);
              },
            ),
            onTap: () async {
              var content =
                  await navigateToEntryForm(context, this.contentList[index]);
              if (content != null) editContent(content);
            },
          ),
        );
      },
    );
  }

  //buat contact
  void addContent(Content object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  //edit contact
  void editContent(Content object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  //delete contact
  void deleteContent(Content object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Content>> contentListFuture = dbHelper.getContentList();
      contentListFuture.then((contentList) {
        setState(() {
          this.contentList = contentList;
          this.count = contentList.length;
        });
      });
    });
  }
}
