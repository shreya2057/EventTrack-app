import 'package:eventrack_app/app/models/user/user.dart';

//TODO: searchEvents and FilterEvents
abstract class SignUpProvider {
  Future<User?> registerUser({Map<String, dynamic> data});
}
