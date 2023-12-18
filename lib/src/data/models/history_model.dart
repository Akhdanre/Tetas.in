class EggIncubator {
  int id;
  String inkubatorId;
  String startData;
  String endDataEstimation;
  int numberOfEgg;

  EggIncubator({
    required this.id,
    required this.inkubatorId,
    required this.startData,
    required this.endDataEstimation,
    required this.numberOfEgg,
  });

  factory EggIncubator.fromJson(Map<String, dynamic> json) {
    return EggIncubator(
      id: json['id'],
      inkubatorId: json['inkubator_id'],
      startData: json['start_data'],
      endDataEstimation: json['end_data_estimation'],
      numberOfEgg: json['number_of_egg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'inkubator_id': inkubatorId,
      'start_data': startData,
      'end_data_estimation': endDataEstimation,
      'number_of_egg': numberOfEgg,
    };
  }
}

class EggIncubatorResponse {
  List<EggIncubator> data;
  dynamic errors;

  EggIncubatorResponse({
    required this.data,
    this.errors,
  });

  factory EggIncubatorResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> rawData = json['data'];
    List<EggIncubator> eggIncubators = List<EggIncubator>.from(
        rawData.map((data) => EggIncubator.fromJson(data)));

    return EggIncubatorResponse(
      data: eggIncubators,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> rawData =
        data.map((eggIncubator) => eggIncubator.toJson()).toList();

    return {
      'data': rawData,
      'errors': errors,
    };
  }
}
