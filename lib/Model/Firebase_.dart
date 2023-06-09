import 'package:firebase_auth/firebase_auth.dart';

class Firebase_{
  late FirebaseAuth firebase;
  Firebase_(FirebaseAuth f){
    this.firebase=f;
  }

  Object? authWithEmailAndPassword(String email,String password) async{
    try{

      UserCredential userCredential = await firebase.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      );
      print(userCredential);
      return userCredential;


    }catch(e){
      return null;
    }
  }

  Object? SignupWithEmailAndPassword(String email,String password) async{
    try{

      UserCredential userCredential = await firebase.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      );
     
      return userCredential;

    }on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        return true;
      }
      return null;
    }
  }
  singOut()async{
    await firebase.signOut();
  }
}