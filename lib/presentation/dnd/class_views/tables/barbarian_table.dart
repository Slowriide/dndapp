import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:flutter/material.dart';

class BarbarianFeaturesTable extends StatelessWidget {
  final List<LevelPerClass>? levels;

  const BarbarianFeaturesTable({
    super.key,
    required this.levels,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final title = textStyles.bodyMedium!.copyWith(color: Colors.grey);

    if (levels == null) {
      return const Text('Loading...');
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
            WidgetStateColor.resolveWith((states) => theme.surface),
        dataRowColor: WidgetStateColor.resolveWith((states) => theme.surface),
        border: TableBorder(
          horizontalInside: BorderSide(color: theme.surface, width: 2),
        ),
        columns: [
          DataColumn(
            label: Text(
              'LEVEL',
              style: textStyles.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ),
          DataColumn(
            label: Text('PROFICIENCY BONUS', style: title),
          ),
          DataColumn(
            label: Text('RAGE', style: title),
          ),
          DataColumn(
            label: Text('RAGE DAMAGE', style: title),
          ),
        ],
        rows: levels!.map((level) {
          return DataRow(cells: [
            DataCell(Text(level.level.toString())), // Nivel

            DataCell(
              Text('+${level.profBonus.toString()}'),
            ), // Bonus de competencia
            DataCell(
              Text(level.classSpecific?.rageCount.toString() ?? 'N/A'),
            ), // Número de veces que puede hacer Rage
            DataCell(
              Text(level.classSpecific?.rageDamageBonus.toString() ?? 'N/A'),
            ), // Daño de Rage
          ]);
        }).toList(),
      ),
    );
  }
}
