import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soriana_tracker/data/models/sucursal_model.dart';

class SidebarRepository {
  final String id;
  DatabaseService service = DatabaseService();

  SidebarRepository(this.id);

  Future<SucursalModel> retrieveSucursales() {
    return service.retrieveSucursales(id);
  }

  // @override
  // Future<void> saveUserData(SucursalModel user) {
  //   return service.addUserData(user);
  // }

}

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<SucursalModel> retrieveSucursales(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("sucursales").doc(id).get();
    // return snapshot.docs
    //     .map((docSnapshot) => SucursalModel.fromMap(docSnapshot.data()))
    //     .toList();

    return SucursalModel.fromMap(snapshot);
  }

  // addUserData(SucursalModel userData) async {
  //   await _db.collection("Users").doc(userData.id).set(userData.toMap());
  // }

  // Future<String> retrieveUserName(SucursalModel user) async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("Users").doc(user.id).get();
  //   return snapshot.data()!["displayName"];
  // }
}
