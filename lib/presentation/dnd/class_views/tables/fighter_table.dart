import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:flutter/material.dart';

class FighterFeaturesTable extends StatelessWidget {
  final List<LevelPerClass>? levels;

  const FighterFeaturesTable({
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
            label: Text('CLASS FEATURES', style: title),
          ),
          DataColumn(
            label: Text('ACTION SURGES', style: title),
          ),
          DataColumn(
            label: Text('INDOMITABLE USES', style: title),
          ),
          DataColumn(
            label: Text('EXTRA ATTACKS', style: title),
          ),
        ],
        rows: levels!.map((level) {
          return DataRow(cells: [
            DataCell(Text(level.level.toString())), // Nivel

            //Proficency
            DataCell(
              Text('+${level.profBonus.toString()}'),
            ),
            //Class Features
            DataCell(
              Text(
                level.features?.map((f) => f.name).join(', ') ?? 'No features',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //Action surges
            DataCell(
              Text(level.classSpecific?.actionSurges.toString() ?? 'N/A'),
            ),
            //INDOMITABLE USES
            DataCell(
              Text(level.classSpecific?.indomitableUses.toString() ?? 'N/A'),
            ),
            //EXTRA ATTACKS
            DataCell(
              Text(level.classSpecific?.extraAttacks.toString() ?? 'N/A'),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
