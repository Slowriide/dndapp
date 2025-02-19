import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/feature.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/feature_respository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/levels_class.dart';
import 'package:dnd_app/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final featureInfoProvider =
    StateNotifierProvider<FeatureMapNotifier, Map<String, List<Feature>>>(
  (ref) {
    final repository = sl<FeatureRepository>();

    return FeatureMapNotifier(getFeature: repository.getFeature);
  },
);

/*
  {
  'aboleth': Monster(),
  'blue-eyes-White-dragon-': Monster(),
  }
*/

typedef FeatureCallback = Future<List<Feature>> Function(String id);

class FeatureMapNotifier extends StateNotifier<Map<String, List<Feature>>> {
  final FeatureCallback getFeature;

  FeatureMapNotifier({required this.getFeature}) : super({});

  Future<void> loadFeature(String id) async {
    if (state.containsKey(id)) return;
    // ignore: avoid_print
    print('realizando peticion http lvl');
    final feature = await getFeature(id);

    state = {...state, id: feature};
  }
}
