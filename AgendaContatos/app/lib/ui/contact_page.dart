import 'dart:io';

import 'package:app/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  ContactPage({this.contact}) {}

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _userEdited = false;
  late Contact _editedContact;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: _editedContact.img != null
                          ? FileImage(File(_editedContact.img))
                          : AssetImage("images/person.png") as ImageProvider),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _userEdited = true;

                setState(() {
                  _editedContact.name = text;
                });
              },
              controller: _nameController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "E-mail"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Phone"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
              keyboardType: TextInputType.phone,
              controller: _phoneController,
            )
          ],
        ),
      ),
    );
  }
}
