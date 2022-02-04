import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:very_cool_app/screens/Home.dart';

loadFirebaseData(activeUtilityID) async{
  //load the home name from database
  FirebaseFirestore.instance.collection('Home').where('userID', isEqualTo: 'Lcbhgc2YSzFBpxe5imIc').get().then((value){

      homeName = value.docs[0]["name"];

  });

  FirebaseFirestore.instance.collection('Bill').where('utilityID', isEqualTo: activeUtilityID).get().then((value){

    print(value.docs);
    print('-------');

  });
}


