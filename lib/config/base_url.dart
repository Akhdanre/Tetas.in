class BaseUrl {
  static String host = "172.16.106.124";
  static int port = 8000;
  static List<String> type = ["api", "ws"];

  static String fullApiUrl = "http://$host:$port/${type[0]}";
  static String fullWsUrl = "ws://$host:$port/${type[1]}";
}
