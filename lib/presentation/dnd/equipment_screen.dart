import 'package:dnd_app/domain/entities/dnd/specifics/equipment.dart';
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
                  const _MySizedBox(),
                  const _Divider(),
                  const _MySizedBox(),
                  Row(
                    children: [
                      Text('Weight: ', style: textStyles.bodyMedium),
                      Text(
                        '${equipment.weight.toString()} lb.',
                        style: textStyles.bodySmall,
                      )
                    ],
                  ),
                  const _MySizedBox(),
                  Row(
                    children: [
                      Text('Cost: ', style: textStyles.bodyMedium),
                      Text(
                        '${equipment.cost?.quantity.toString()} ${equipment.cost?.unit}',
                        style: textStyles.bodySmall,
                      ),
                    ],
                  ),
                  const _MySizedBox(),
                  const _Divider(),
                  const _MySizedBox(),
                  if (equipment.desc.isNotEmpty) Text(equipment.desc.join(''))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.equipment,
    required this.textStyles,
  });

  final Equipment? equipment;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border_sharp,
              size: 30,
              color: Color.fromARGB(185, 50, 92, 228),
            ),
          )
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

class _MySizedBox extends StatelessWidget {
  final double? height;
  // ignore: unused_element
  const _MySizedBox({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 17);
  }
}
