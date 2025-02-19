import 'package:dnd_app/domain/entities/dnd/specifics/class_levels.dart';
import 'package:flutter/material.dart';

class SorcererFeaturesTable extends StatelessWidget {
  final List<LevelPerClass>? levels;

  const SorcererFeaturesTable({
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
            label: Text('SORCERY POINS', style: title),
          ),
          DataColumn(
            label: Text('CANTRIPS', style: title),
          ),
          DataColumn(
            label: Text('PREPARED SPELLS', style: title),
          ),
          DataColumn(
            label: Text('1', style: title),
          ),
          DataColumn(
            label: Text('2', style: title),
          ),
          DataColumn(
            label: Text('3', style: title),
          ),
          DataColumn(
            label: Text('4', style: title),
          ),
          DataColumn(
            label: Text('5', style: title),
          ),
          DataColumn(
            label: Text('6', style: title),
          ),
          DataColumn(
            label: Text('7', style: title),
          ),
          DataColumn(
            label: Text('8', style: title),
          ),
          DataColumn(
            label: Text('9', style: title),
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
            //Sorcery points
            DataCell(
              Text(level.classSpecific?.sorceryPoints.toString() ?? 'N/A'),
            ),
            //Cantrips
            DataCell(
              Text(level.spellcasting?.cantripsKnown.toString() ?? 'N/A'),
            ),
            //Prepared spells
            DataCell(
              Text(level.spellcasting?.spellsKnown.toString() ?? 'N/A'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel1.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel2.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel3.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel4.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel5.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel6.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel7.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel8.toString() ?? '-'),
            ),
            //LVLS
            DataCell(
              Text(level.spellcasting?.spellSlotsLevel9.toString() ?? '-'),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
