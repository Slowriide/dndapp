import 'package:dnd_app/common/widgets/background.dart';

abstract class BackgroundsRepository {
  Future<List<Background>> getBackgrounds();
}
