class BaseUrl {
  static String host = "";
  static int port = 8000;
  static List<String> type = ["api", "ws"];

  static String fullApiUrl = "http://$host:$port/${type[0]}";
  static String fullWsUrl = "ws://$host:$port/${type[1]}";
}
