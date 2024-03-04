import 'package:flutter/material.dart';
import 'package:maadi_54_db/local/my_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List< Map<String, dynamic> > contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async{
              MyDatabase db = MyDatabase();
              contacts = await db.getData();
              setState(() {});
            }, 
            icon: Icon(Icons.download),
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index){
            return Text("${contacts[index]["name"]} , ${contacts[index]["phone"]}", style: TextStyle(fontSize: 20),);
          },
        )
      ),
    );
  }
}

// Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     TextButton(
//       onPressed: (){
//         MyDatabase db = MyDatabase();
//         db.insert("Hassan", "011111111111");
//       }, 
//       child: Text("Add contact"),
//     ),
//     TextButton(
//       onPressed: (){
//         MyDatabase db = MyDatabase();
//         db.getData();
//       }, 
//       child: Text("Get Data"),
//     ),
//   ],
// ),