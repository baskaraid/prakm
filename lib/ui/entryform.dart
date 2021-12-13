import 'package:flutter/material.dart';
import 'package:crud_sqliteback1/models/content.dart';

class EntryForm extends StatefulWidget {
  final Content content;

  EntryForm(this.content);

  @override
  EntryFormState createState() => EntryFormState(this.content);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Content content;

  EntryFormState(this.content);

  TextEditingController judulController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (content != null) {
      judulController.text = content.judul;
      fotoController.text = content.foto;
      deskripsiController.text = content.deskripsi;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: content == null ? Text('Tambah') : Text('Rubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: judulController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // telepon
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: fotoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Link Foto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: deskripsiController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (content == null) {
                            // tambah data
                            content = Content(judulController.text,
                                fotoController.text, deskripsiController.text);
                          } else {
                            // ubah data
                            content.judul = judulController.text;
                            content.foto = fotoController.text;
                            content.deskripsi = deskripsiController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, content);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
