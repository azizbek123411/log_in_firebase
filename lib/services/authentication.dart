

import 'package:firebase_auth/firebase_auth.dart';



class AuthServices {
FirebaseAuth _auth=FirebaseAuth.instance;
  //sign in/login
  Future<User?> signUpWithEmailAndPassword(String email,String password) async {


    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print('Some error');
    }
    return null;
  }






}