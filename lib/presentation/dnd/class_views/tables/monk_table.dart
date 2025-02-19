import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:flutter/material.dart';

class MonkFeaturesTable extends StatelessWidget {
  final List<LevelPerClass>? levels;

  const MonkFeaturesTable({
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
            label: Text('MARTIAL ARTS', style: title),
          ),
          DataColumn(
            label: Text('KI POINTS', style: title),
          ),
          DataColumn(
            label: Text('UNARMORED MOVEMENT', style: title),
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
            //MARTIAL ARTS
            DataCell(
              Text(
                  '${level.classSpecific?.martialArts?.diceCount.toString()}d${level.classSpecific?.martialArts?.diceValue.toString()}'),
            ),
            //KI POINTS
            DataCell(
              Text(level.classSpecific?.kiPoints.toString() ?? 'N/A'),
            ),
            //UNARMORED MOVEMENT
            DataCell(
              Text(level.classSpecific?.unarmoredMovement.toString() ?? 'N/A'),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
