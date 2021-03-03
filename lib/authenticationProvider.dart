import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationProvider {

  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance

  AuthenticationProvider(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance


  //Using Stream to listen to Authentication State
  Stream<User> get authState => firebaseAuth.idTokenChanges();


  //SIGN UP METHOD
  Future<int> signUp({String email, String password}) async {
    try 
    {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
      if(result!=null)
      {
        return 1 ; 
      }
      else return 0 ; 
    } 
    on FirebaseAuthException catch (e) 
    {
      return(0);
    }
  }
  //SIGN IN METHOD
  Future<int> logIn({String email, String password}) async {
    try 
    {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if(result!=null)
      {
        return 1 ; 
      }
      else return 0 ; 
    } 
    on FirebaseAuthException catch (e) 
    {
      return 0 ; 
    }
  }
  
  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}

