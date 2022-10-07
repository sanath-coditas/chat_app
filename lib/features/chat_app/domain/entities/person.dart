import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String name;
  final String image;
  final int id;

  const Person({required this.id, required this.name, required this.image});
  @override
  List<Object?> get props => [name, image, id];
}
