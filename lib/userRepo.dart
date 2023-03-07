import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final db = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
class userRepo{

  static Map<String,dynamic> _initializeUserMap={
    'name':'',
    'phone':'',
    'password':'',
    'role':'',  //no changing
    'appLang':'',
    'sLang':<String>[],
    'online status':'online',
    'friends uid list':<String>[],
    'uid':'',
  };


  static void setInitialName(String name){
    _initializeUserMap['name']=name;
  }
  static void setInitialPhone(String phone){
    _initializeUserMap['phone']='+65'+phone;
  }
  static void setInitialPassword(String password){
    _initializeUserMap['password']=password;
  }
  static void setInitialRole(String role){
    _initializeUserMap['role']=role;

  }
  static void setInitialAppLang(String appLang){
    _initializeUserMap['appLang']=appLang;

  }
  static void setInitialSLang(List<String> sLang){
    _initializeUserMap['sLang']=sLang;

  }
  static void setUid(String? uid){
    _initializeUserMap['uid']=uid;

  }

  static Future<void>createUser()async{
    try{
      db.collection('users')
        .doc(_initializeUserMap['role'])
        .collection('profiles')
        .doc(_initializeUserMap['uid'])
        .set(_initializeUserMap);
    }catch(e){
      print(e.toString());
    }

  }

  //assuming role and uid doesn't change after registration
  static final _userDocRef = db.collection('users')
      .doc(_initializeUserMap['role'])
      .collection('profiles')
      .doc(_initializeUserMap['uid']);

  //fetch data aft authenticated
  static Future<Map<String, dynamic>?>getUserAsMap()async{

    _userDocRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;

      },
      onError: (e) {
            print("Error getting document: $e");
            return null;
            },
    );
  }


 /* Future<void>getUserName()async{

  }

  Future<void>getUserPhone()async {

  }

  Future<void>getUserRole()async {


  }
  Future<void>getUserAppLang()async{}
  Future<void>getUserSLang()async {}
  Future<void>getUserOnlineStatus()async{}
  Future<void>getFriends()async{}*/



  static Future<void>updateUserName(String name)async{

    final data = {"name": name };

    _userDocRef.set(data, SetOptions(merge: false));
  }

  static Future<void>updateUserPhone(String phone)async{
    final data = {"phone": '+65'+ phone };

    _userDocRef.set(data, SetOptions(merge: false));

  }
  static Future<void>updateUserPassword(String newPassword)async{
    final data = {"password": newPassword };

    _userDocRef.set(data, SetOptions(merge: false));

  }

  static Future<void>updateUserAppLang(String appLang)async{
    final data = {"appLang": appLang };

    _userDocRef.set(data, SetOptions(merge: false));
  }

  static Future<void>addUserSLang(String SLang)async{
    final Map<String, dynamic>? userMap= await getUserAsMap();
    if (userMap!=null){
      final List<String> newSLangList=userMap["sLang"].add(SLang);
      final data = {"sLang": newSLangList };
      _userDocRef.set(data, SetOptions(merge: false));

    }


  }
  static Future<void>deleteUserSLang(String SLang)async{
    final Map<String, dynamic>? userMap= await getUserAsMap();
    if (userMap!=null){
      final List<String> newSLangList=userMap["sLang"].remove(SLang);
      final data = {"sLang": newSLangList };
      _userDocRef.set(data, SetOptions(merge: false));

    }
  }
  static Future<void>addFriend(String uid)async{
    final Map<String, dynamic>? userMap= await getUserAsMap();
    List<String> newFriendList=[];
    if (userMap!=null){

      final List<String> newFriendList = userMap["friends uid list"].add(uid);
      final data = {"friends uid list": newFriendList };
      _userDocRef.set(data, SetOptions(merge: false));

    }
  }
  static Future<void>deleteFriend(String uid)async{
    final Map<String, dynamic>? userMap= await getUserAsMap();
    List<String> newFriendList=[];
    if (userMap!=null){
      try{
        newFriendList=userMap["friends uid list"].remove(uid);


      }catch(e){
        print("uid doesn't exist");
      }
      final data = {"friends uid list": newFriendList };
      _userDocRef.set(data, SetOptions(merge: false));



    }
  }

  static Future<void>updateUserOnlineStatus(String onlineStatus)async{
    final data = {"online status": onlineStatus };

    _userDocRef.set(data, SetOptions(merge: false));

  }

  //delete; should not be controlled by user???
  Future<void>deleteUser()async{

  }

}
