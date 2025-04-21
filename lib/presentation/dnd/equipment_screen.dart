import 'package:dnd_app/common/widgets/basic_rules_mark.dart';
import 'package:dnd_app/common/widgets/general/my_sized_box.dart';
import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
import 'package:dnd_app/presentation/providers/db/favorite_equipment_provider.dart';
import 'package:dnd_app/presentation/providers/db/local_storage_provider.dart';
import 'package:dnd_app/presentation/providers/equipment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentScreen extends ConsumerStatefulWidget {
  final String equipmentId;
  const EquipmentScreen({super.key, required this.equipmentId});

  @override
  EquipmentScreenState createState() => EquipmentScreenState();
}

class EquipmentScreenState extends ConsumerState<EquipmentScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(equipmentInfoProvider.notifier).loadEquipment(widget.equipmentId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final Equipment? equipment =
        ref.watch(equipmentInfoProvider)[widget.equipmentId];

    if (equipment == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(equipment: equipment, textStyles: textStyles),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  equipment.equipmentCategory != null
                      ? Text(equipment.equipmentCategory!.name)
                      : const Text(''),
                  const MySizedBox(),
                  const _Divider(),
                  const MySizedBox(),
                  Row(
                    children: [
                      Text('Weight: ', style: textStyles.bodyMedium),
                      Text(
                        '${equipment.weight.toString()} lb.',
                        style: textStyles.bodySmall,
                      )
                    ],
                  ),
                  const MySizedBox(),
                  Row(
                    children: [
                      Text('Cost: ', style: textStyles.bodyMedium),
                      Text(
                        '${equipment.cost?.quantity.toString()} ${equipment.cost?.unit}',
                        style: textStyles.bodySmall,
                      ),
                    ],
                  ),
                  const MySizedBox(),
                  const _Divider(),
                  const MySizedBox(),
                  if (equipment.desc!.isNotEmpty)
                    Text(equipment.desc!.join('')),
                  const MySizedBox(height: 30),
                  const BasicRulesMark()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

final isFavProvider =
    FutureProvider.family.autoDispose((ref, String equipmentId) {
  final localStorageRepository = ref.watch(equipmentStorageRepositoryProvider);

  return localStorageRepository.isEquipmentFavorite(equipmentId);
});

class _AppBar extends ConsumerWidget {
  const _AppBar({
    required this.equipment,
    required this.textStyles,
  });

  final Equipment? equipment;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavFuture = ref.watch(isFavProvider(equipment!.index));
    return SliverAppBar(
      expandedHeight: 75,
      floating: false,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Row(
        children: [
          Text(equipment!.name, style: textStyles.bodyMedium),
          const Spacer(),
          IconButton(
              onPressed: () async {
                // ref
                //     .read(LocalStorageRepositoryProvider)
                //     .toggleFavorite(monster!);
                await ref
                    .read(favoriteEquipmentProvider.notifier)
                    .toggleFavorite(equipment!);
                ref.invalidate(isFavProvider(equipment!.index));
              },
              icon: isFavFuture.when(
                loading: () =>
                    const Icon(Icons.bookmark_add_outlined, size: 30),
                error: (_, __) => throw UnimplementedError(),
                data: (isFavorite) => isFavorite
                    ? const Icon(Icons.bookmark_added_rounded, size: 30)
                    : const Icon(Icons.bookmark_add_outlined, size: 30),
              )

              //  const Icon(Icons.bookmark_add_outlined, size: 30),
              ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Color.fromARGB(185, 50, 92, 228));
  }
}
