import 'package:cloud_firestore/cloud_firestore.dart';

class UserModal{
  UserModal({required this.id, required this.name, required this.email, this.photoUrl});
  String id;
    String name;
    String email;
    String? photoUrl;

}
// User = User(
//   displayName: Khansa Widhani, 
//   email: khansa.ashraf23@gmail.com, 
//   emailVerified: true, 
//   isAnonymous: false, 
//   metadata: UserMetadata(
//     creationTime: 2021-11-03 09:52:54.871, 
//     lastSignInTime: 2021-11-04 05:31:05.947
//   ), 
//   phoneNumber: null, 
//   photoURL: https://lh3.googleusercontent.com/a-/AOh14Gij_pcmSe1nF3ZBnjVdwxc_TgtGLEflKMEbX8MzVNk=s96-c, 
//   providerData, 
//   [UserInfo(
//     displayName: Khansa Widhani, 
//     email: khansa.ashraf23@gmail.com, 
//     phoneNumber: null, 
//     photoURL: https://lh3.googleusercontent.com/a-/AOh14Gij_pcmSe1nF3ZBnjVdwxc_TgtGLEflKMEbX8MzVNk=s96-c, 
//     providerId: google.com, 
//     uid: 115839374833179371843)], 
//     refreshToken: , 
//     tenantId: null, 
//     uid: IzwQCpe6IyYKAvIVPRxLO7t6NCg2)
