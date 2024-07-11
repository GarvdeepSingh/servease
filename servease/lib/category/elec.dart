import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servease/consts/consts.dart';


class Elec extends StatefulWidget {
  const Elec({super.key});

  @override
  State<Elec> createState() => _ElecState();
}

class _ElecState extends State<Elec> {
  final _userstream = FirebaseFirestore.instance.collection('tilak nagar').doc('1').collection('elec').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("elec"),
      ),
      body: StreamBuilder(stream: _userstream,builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('conection error');
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Text('loading...');
        }
        var docs = snapshot.data!.docs;
        // return Text('${docs.length}');
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context,index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(docs[index]['name']),
              subtitle: Text('${docs[index]['rating']}'),
            );
          });
      },),
    );
  }
}