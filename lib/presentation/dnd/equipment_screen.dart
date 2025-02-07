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
      body: Center(
        child: Text(equipment.name),
      ),
    );
  }
}
