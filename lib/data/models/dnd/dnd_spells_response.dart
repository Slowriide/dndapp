import 'package:dnd_app/data/models/dnd/spells_response_dnd.dart';

class SpellsResponse {
  final int count;
  final List<SpellsDndResponse> results;

  SpellsResponse({
    required this.count,
    required this.results,
  });

  factory SpellsResponse.fromJson(Map<String, dynamic> json) => SpellsResponse(
        count: json["count"],
        results: List<SpellsDndResponse>.from(
            json["results"].map((x) => SpellsDndResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
