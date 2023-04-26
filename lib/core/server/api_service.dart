import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/facts/random")
  Future<HttpResponse> getCatFact(
      @Query("animal_type") String animalType, @Query("amount") int amount);
}
