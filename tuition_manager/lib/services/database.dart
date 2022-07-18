import 'package:cloud_firestore/cloud_firestore.dart';

class AuthData {
  FirebaseFirestore _user = FirebaseFirestore.instance;

  // add students to db

  addStudent(
    String name,
    String address,
    String email,
    String phoneNumber,
    String uid,
    String role,
  ) async {
    await _user.collection('AddStudent').doc(uid).set({
      'name': name,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'time': DateTime.now()
    });
  }

  // Add Teacher to Database
  addTeacher(String Fname, String Lname, String email,
      String phoneNumber, String uid, String role) async {
    await _user.collection('AddTeacher').doc(uid).set({
      'Fname': Fname,
      'Lname': Lname,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'time': DateTime.now(),
    });
  }

  // Add Panel to Database
  addManager(String name, String email,
      String phoneNumber, String uid, String role)
  async {
    await _user.collection('AddManager').doc(uid).set({
      'Name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'role': role,
      'time': DateTime.now(),
    });
  }

  // add teacher slot
  addSlot(int num, String email) async {
    await _user.collection("Slots").doc(email).set({
      'slot': num,
    });
  }

  // Fetch Student Record List
  fetchStudent() {
    return _user.collection('AddStudent').orderBy('time').snapshots();
  }

  // Fetch Teacher Record List
  fetchTeacher() {
    return _user.collection('AddTeacher').orderBy('time').snapshots();
  }
  // Fetch Panel Record List
  fetchPanel() {
    return _user.collection('AddManager').orderBy('time').snapshots();
  }
  // Fetch Panel Students Record List
  fetchPanelStudent(String? email) {
    return _user.collection('Manager_Students').doc(email).collection("MyStudents").orderBy('time').snapshots();
  }
  // Get Panel List
  Future getPanelList() async {
    return _user.collection('UploadPanelList').orderBy('DateTime').snapshots();
  }

  // Request Submission Form
  Future requestSubmit(mapData, String stdId) async {
    await _user
        .collection("StudentsRequest")
        .doc(stdId)
        .set(mapData)
        .catchError((e) {
      print(e);
    });
  }

  //Get Student record using email
  getUserByUserEmailFromStudent(String email) async {
    try {
      return _user
          .collection('AddStudent')
          .where("email", isEqualTo: email)
          .get();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // Get Panel Data from firebase
  getPanelByUserEmailFromStudent(String email) async {
    try {
      return _user
          .collection('AddManager')
          .where("email", isEqualTo: email)
          .get();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// Get Teacher record using email
  getUserByUserEmailFromTeacher(String email) async {
    try {
      return _user
          .collection('AddTeacher')
          .where("email", isEqualTo: email)
          .get();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Fetch Teacher Slot
  fetchSlot(String email) {
    try {
      return _user.collection('Slots').doc(email).get();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Get notifiy
  Future getNotificationByTeacherEmail(String email) async {
    return _user
        .collection('StudentsRequest')
        .where("SupervisorEmail", isEqualTo: email)
        .snapshots();
  }

  // Add Chat
  Future addChatRoom(chatRoomId, chatRoom) async {
    await _user
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  //get chat room
  getUserChats(String itIsMyName) async {
    return _user
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  //Send Messages
  Future<void> addMessage(String chatRoomId, chatMessageData) async {
    _user
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  // Fetch Registered Stds
  getRegisteredStds(String email) async {
    try {
      return _user
          .collection('AcceptedStudent')
          .where("SupervisorEmail", isEqualTo: email)
          .snapshots();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // get chats
  getChats(String chatRoomId) async {
    return _user
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future addAcceptedStudentData(mapData) async {
    _user.collection("AcceptedStudent").doc().set(mapData).catchError((e) {
      print(e);
    });
  }
}
