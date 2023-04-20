import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;

  const User(this.id, this.name);

  @override
  List<Object?> get props => [id, name];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
    );
  }
}
