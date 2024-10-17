import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class User {
  int? id;
  String customerName;
  String customerFistName;
  String cpfString;
  String email;
  String phone;
  String city;
  String uf;
  DateTime dateInitial;
  String tokenValidation;
  bool setupDone;
  bool premium;
  bool member;
  bool student;
  bool? enabledMFA;
  int? customerId;

  User({
    this.id,
    required this.customerName,
    required this.customerFistName,
    required this.cpfString,
    required this.email,
    required this.phone,
    required this.city,
    required this.uf,
    required this.dateInitial,
    required this.tokenValidation,
    required this.setupDone,
    required this.premium,
    required this.member,
    required this.student,
    this.enabledMFA = false,
    this.customerId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    late User user;

    try {
      // json['email'] = null;
      user = User(
        id: json['ID'],
        customerName: json['CustomerName'],
        customerFistName: json['CustomerFistName'],
        cpfString: json['CPFString'],
        email: json['Email'],
        phone: json['Phone'],
        city: json['City'],
        uf: json['UF'],
        dateInitial: DateTime.parse(json['DateInitial'] as String),
        tokenValidation: json['TokenValidation'],
        setupDone: json['SetupDone'],
        premium: json['Premium'] ?? false,
        member: json['Member'] ?? false,
        student: json['Student'],
        enabledMFA: json['EnabledMFA'],
        customerId: json['CustomerID'],
      );
    } on Exception catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, information: [json]);
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['CustomerName'] = customerName;
    data['CustomerFistName'] = customerFistName;
    data['CPFString'] = cpfString;
    data['Email'] = email;
    data['Phone'] = phone;
    data['City'] = city;
    data['UF'] = uf;
    data['DateInitial'] = dateInitial.toString();
    data['TokenValidation'] = tokenValidation;
    data['SetupDone'] = setupDone;
    data['Premium'] = premium;
    data['Member'] = member;
    data['Student'] = student;
    data['EnabledMFA'] = enabledMFA;
    return data;
  }
}
