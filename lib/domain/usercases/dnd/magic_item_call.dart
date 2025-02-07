import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/magic_item.dart';

import 'package:dnd_app/domain/repositories/dnd/specifics/magic_item_repository.dart';

class MagicItemCallUsecase implements Usecase<MagicItem, String> {
  final MagicItemRepository repository;

  MagicItemCallUsecase(this.repository);
  @override
  Future<MagicItem> call({required String params}) async {
    return await repository.getMagicItem(params);
  }
}
