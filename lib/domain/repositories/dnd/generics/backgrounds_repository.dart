import 'package:dnd_app/common/widgets/general/background.dart';

abstract class BackgroundsRepository {
  Future<List<Background>> getBackgrounds();
}
