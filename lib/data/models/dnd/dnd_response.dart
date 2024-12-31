import 'package:dnd_app/data/models/dnd/generic_response_dnd.dart';

class ApiResponse {
  final int count;
  final List<GenericDndResponse> results;

  ApiResponse({
    required this.count,
    required this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        count: json["count"],
        results: List<GenericDndResponse>.from(
            json["results"].map((x) => GenericDndResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
