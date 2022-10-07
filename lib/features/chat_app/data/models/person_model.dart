import 'package:chat_app/constants/json_key_constants.dart';
import 'package:chat_app/features/chat_app/domain/entities/person.dart';

class PersonModel extends Person {
  const PersonModel(
      {required int modelId,
      required String modelName,
      required String modelImage})
      : super(id: modelId, name: modelName, image: modelImage);
  @override
  List<Object?> get props => [name, image, id];
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        modelId: json[JSONKeyContants.id],
        modelName: json[JSONKeyContants.name],
        modelImage: json[JSONKeyContants.image]);
  }

  static Map<String, dynamic> toJson(Person person) {
    Map<String, dynamic> map = {
      JSONKeyContants.id: person.id,
      JSONKeyContants.name: person.name,
      JSONKeyContants.image: person.image,
    };
    return map;
  }
}
