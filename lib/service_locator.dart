import 'package:dnd_app/data/repositories/auth/auth_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/class_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/classes_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/equipment_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/equipments_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/feats_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/magicitem_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/magicitems_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/monster_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/monsters_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/race_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/races_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/spell_repository_impl.dart';
import 'package:dnd_app/data/repositories/dnd/spells_repository_impl.dart';
import 'package:dnd_app/data/sources/dnd/dnd_datasource.dart';
import 'package:dnd_app/data/sources/auth/firebase_auth_datasource.dart';
import 'package:dnd_app/domain/repositories/auth/auth_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/generic_repos.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/class_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/magic_item_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository%20copy.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/monster_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/races_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/generics/spells_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/race_repository.dart';
import 'package:dnd_app/domain/repositories/dnd/specifics/spell_repository.dart';
import 'package:dnd_app/domain/usercases/auth/signin.dart';
import 'package:dnd_app/domain/usercases/auth/signup.dart';
import 'package:dnd_app/domain/usercases/dnd/class_call.dart';
import 'package:dnd_app/domain/usercases/dnd/classes_call.dart';
import 'package:dnd_app/domain/usercases/dnd/equipment_call.dart';
import 'package:dnd_app/domain/usercases/dnd/equipments_call.dart';
import 'package:dnd_app/domain/usercases/dnd/feats_call.dart';
import 'package:dnd_app/domain/usercases/dnd/magic_item_call.dart';
import 'package:dnd_app/domain/usercases/dnd/magic_items_call.dart';
import 'package:dnd_app/domain/usercases/dnd/monster_call.dart';
import 'package:dnd_app/domain/usercases/dnd/monsters_Call.dart';
import 'package:dnd_app/domain/usercases/dnd/race_call.dart';
import 'package:dnd_app/domain/usercases/dnd/races_call.dart';
import 'package:dnd_app/domain/usercases/dnd/spell_call.dart';
import 'package:dnd_app/domain/usercases/dnd/spells_call.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //DataSources
  sl.registerSingleton<AuthfirebaseService>(
    AuthfirebaseServiceImpl(),
  );

  sl.registerLazySingleton<DndDatasource>(
    () => DndDatasourceImpl(),
  );

  //Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerLazySingleton<MonstersRepository>(
    () => MonstersRepositoryImpl(sl<DndDatasource>()),
  );

  sl.registerLazySingleton<ClassesRepository>(
    () => ClassesRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<MagicItemsRepository>(
    () => MagicitemsRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<EquipmentGenericRepository>(
    () => EquipmentGenericRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<FeatsRepository>(
    () => FeatsRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<RacesRepository>(
    () => RacesRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<SpellsRepository>(
    () => SpellsRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<MonsterRepository>(
    () => MonsterRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<MagicItemRepository>(
    () => MagicitemRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<EquipmentRepository>(
    () => EquipmentRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<SpellRepository>(
    () => SpellRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<RaceRepository>(
    () => RaceRepositoryImpl(sl<DndDatasource>()),
  );
  sl.registerLazySingleton<ClassRepository>(
    () => ClassRepositoryImpl(sl<DndDatasource>()),
  );

  //UseCases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
  sl.registerLazySingleton<MonstersCallUserCase>(
    () => MonstersCallUserCase(sl<MonstersRepository>()),
  );
  sl.registerLazySingleton<ClassesCallUserCase>(
    () => ClassesCallUserCase(sl<ClassesRepository>()),
  );
  sl.registerLazySingleton<MagicItemsCallUserCase>(
    () => MagicItemsCallUserCase(sl<MagicItemsRepository>()),
  );
  sl.registerLazySingleton<EquipmentGenericCallUserCase>(
    () => EquipmentGenericCallUserCase(sl<EquipmentGenericRepository>()),
  );
  sl.registerLazySingleton<FeatsCallUserCase>(
    () => FeatsCallUserCase(sl<FeatsRepository>()),
  );
  sl.registerLazySingleton<RacesCallUserCase>(
    () => RacesCallUserCase(sl<RacesRepository>()),
  );
  sl.registerLazySingleton<SpellsCallUserCase>(
    () => SpellsCallUserCase(sl<SpellsRepository>()),
  );
  sl.registerLazySingleton<MonsterCallUsecase>(
    () => MonsterCallUsecase(sl<MonsterRepository>()),
  );
  sl.registerLazySingleton<MagicItemCallUsecase>(
    () => MagicItemCallUsecase(sl<MagicItemRepository>()),
  );
  sl.registerLazySingleton<EquipmentCallUserCase>(
    () => EquipmentCallUserCase(sl<EquipmentRepository>()),
  );
  sl.registerLazySingleton<SpellCallUsecase>(
    () => SpellCallUsecase(sl<SpellRepository>()),
  );
  sl.registerLazySingleton<RaceCallUseCase>(
    () => RaceCallUseCase(sl<RaceRepository>()),
  );
  sl.registerLazySingleton<ClassCallUserCase>(
    () => ClassCallUserCase(sl<ClassRepository>()),
  );
}
