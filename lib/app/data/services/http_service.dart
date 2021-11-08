import 'package:dio/dio.dart';
const baseUrl = 'https://newsapi.org/';
const apiKey = 'fa7720e2f84b4b93b5457681d58ef902';
class HttpService{
  Dio? dio;

  void config(){
      dio = Dio( 
        BaseOptions(
        baseUrl: baseUrl,
        headers: {"Authorization" : "Bearer $apiKey"}
      ) );
      initializeinterceptors();
      
      }
      initializeinterceptors(){
        dio!.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler ){
            // print('Requesting.... ${options.uri} + ${options.path}');
            return handler.next(options);
          },
          onResponse: (Response response, handler ){
            // print("Getting response : ${response.statusCode} | ${response.statusMessage}");
            return handler.next(response);
          },
          onError: (DioError error, handler){
            return handler.next(error);
          }
        ));
      }

      Future<Response> getRequest(String url)async{
        Response response;
        try{
        response = await dio!.get(url);
        return response;

        }on DioError catch(error){
          // print(error.message);
          throw Exception(error.message);
        }
      }
}