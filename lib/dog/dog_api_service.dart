import 'package:dio/dio.dart';
import 'package:hw2/dog/dog_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.thedogapi.com/v1/"));

  Future<List<DogModel>> getDogImages() async {
    final Response response = await _dio.get("images/search?&page=0&limit=10");
    final List<DogModel> listDogs=<DogModel>[];
    for (var dog in response.data){
      listDogs.add(DogModel.fromJson(dog));
    }
    return listDogs;
  }
}
