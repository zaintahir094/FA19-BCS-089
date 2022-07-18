import 'package:firebase_auth/firebase_auth.dart';
import 'user.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obect based on Firebase User
  // Usser _userFromFirebase(User user) {
  //   return user != null ? Usser(uid: user.uid, email: user.email) : null;
  // }

  // Add Student
  Future<User?> signUpWithEmailandPassword(
      String email,
      String password,
      String name,
      String address,
      String phoneNumber,
      String role) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      AuthData().addStudent(name, address, email,
          phoneNumber, user!.uid, role,);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Add Teacher
  Future<User?> SignUpWithEmailandPassword(
    String email,
    String password,
    String Fname,
    String Lname,
    String phoneNumber,
    String role,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      AuthData()
          .addTeacher(Fname, Lname, email, phoneNumber, user!.uid, role);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Add Manager
  Future<User?> AddManager(
      String name,
      String email,
      String phoneNumber,
      String password,
      String role,
      ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      AuthData()
          .addManager(name,email, phoneNumber, user!.uid, role);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create user obect based on Firebase User
  Usser? _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? Usser(uid: user.uid, email: user.email!) : null;
  }

  // Login
  Future Loginn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user!.emailVerified) {
        return _userFromFirebase(user);
      } else {
        print("User Email is not verified");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Logout
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
