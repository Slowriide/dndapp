import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/magic_items.dart';
import 'package:dnd_app/domain/repositories/dnd/magic_items_repository.dart';

class MagicItemsCallUserCase implements Usecase<List<MagicItems>, void> {
  final MagicItemsRepository repository;

  MagicItemsCallUserCase(this.repository);
  @override
  Future<List<MagicItems>> call({void params}) async {
    return await repository.getMagicItems();
  }
}
