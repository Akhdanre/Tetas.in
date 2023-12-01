// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

BaseModel dataFromJson(String str) => BaseModel.fromJson(json.decode(str));

String dataToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
    DataClass data;
    dynamic errors;

    BaseModel({
        required this.data,
        required this.errors,
    });

    factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        data: DataClass.fromJson(json["data"]),
        errors: json["errors"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "errors": errors,
    };
}

class DataClass {
    String token;

    DataClass({
        required this.token,
    });

    factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
