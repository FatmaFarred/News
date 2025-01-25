import 'package:News/Apis/NewsResponse.dart';

abstract class NewsState {}
class NewsLoadingState extends NewsState {}
class NewsErrorState extends NewsState {
  String? errorMessage ;
  NewsErrorState ({required this.errorMessage});
}
class NewsSuccessState extends NewsState {
  List<Articles>? newsList;
  NewsSuccessState ({required this.newsList});
}

