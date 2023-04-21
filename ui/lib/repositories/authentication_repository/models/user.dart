import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;

  const User(this.id, this.name, this.email, this.role);

  static const User empty = User('', '', '', '');

  @override
  List<Object?> get props => [id, name, email, role];

  bool get isNotEmpty => this != empty;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['email'],
      json['role'],
    );
  }
}
