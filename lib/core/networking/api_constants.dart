class ApiConstants {
  static const String apiBaseUrl = "https://api.themoviedb.org/3/";

  static const String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZmNiYWJmODNhMDE4ZTgyMDdjZmJmMzIwMmQ0MzVjYyIsInN1YiI6IjVlY2Q1Mjg3YTNiNWU2MDAyMjU5YTE0NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.D8GK43j1pkcsN44bXJAazix-C-5xWgAvEwObxI2jq98";
  static const String servicesImagePath = "https://image.tmdb.org/t/p/w500/";

  static const trendingEndPoint = 'trending/all/week';
  static const topRatedEndPoint = 'tv/top_rated';
  static const upComingEndPoint = 'movie/upcoming';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
