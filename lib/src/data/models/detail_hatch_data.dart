import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  List<DetailHatchModel> data;
  dynamic errors;

  Data({
    required this.data,
    required this.errors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<DetailHatchModel>.from(
            json["data"].map((x) => DetailHatchModel.fromJson(x))),
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "errors": errors,
      };
}

class DetailHatchModel {
  int id;
  int idHatchData;
  int temp;
  int humd;
  int waterVolume;
  String time;
  DateTime date;

  DetailHatchModel({
    required this.id,
    required this.idHatchData,
    required this.temp,
    required this.humd,
    required this.waterVolume,
    required this.time,
    required this.date,
  });

  factory DetailHatchModel.fromJson(Map<String, dynamic> json) =>
      DetailHatchModel(
        id: json["id"],
        idHatchData: json["id_hatch_data"],
        temp: json["temp"],
        humd: json["humd"],
        waterVolume: json["water_volume"],
        time: json["time"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_hatch_data": idHatchData,
        "temp": temp,
        "humd": humd,
        "water_volume": waterVolume,
        "time": time,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
