import 'package:app/chat_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  // await Firebase.initializeApp();

  // QuerySnapshot snapshot =
  //     await FirebaseFirestore.instance.collection('mensagens').get();

  // snapshot.docs.forEach((d) {
  //   print(d.data);
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.blue)),
      home: ChatScreen(),
    );
  }
}
