import 'package:dnd_app/common/widgets/characters_popover.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class CustomFloatButton extends StatelessWidget {
  const CustomFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => showPopover(
          width: 455,
          height: 350,
          backgroundColor: Colors.transparent,
          context: context,
          bodyBuilder: (context) => CharactersPopover(
            onCustomAllTap: () {},
            onSimpleTap: () {},
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          height: 50,
          width: 230,
          decoration: BoxDecoration(
            color: theme.primary,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(
              child: Text(
            'CREATE NEW CHARACTER',
            style: TextStyle(
              color: Colors.blue,
            ),
          )),
        ),
      ),
    );
  }
}

//OTRA OPCION DE MENU

// void _showCharacterSelection(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: const Color(0xFF121212), // Color oscuro
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15),
//     ),
//     builder: (context) {
//       return Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _buildOption(
//               context,
//               title:
//                   "Create a character from a selection of exciting premade adventurers!",
//               buttonText: "SIMPLE",
//               onTap: () {
//                 Navigator.pop(context);
//                 // Acción para "Simple"
//               },
//             ),
//             const SizedBox(height: 20),
//             _buildOption(
//               context,
//               title:
//                   "Create a character by making choices using a step-by-step approach.",
//               buttonText: "CUSTOM",
//               onTap: () {
//                 Navigator.pop(context);
//                 // Acción para "Custom"
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Botón azul
//                 minimumSize: const Size(double.infinity, 50),
//               ),
//               onPressed: () => Navigator.pop(context),
//               child:
//                   const Text("CANCEL", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Widget _buildOption(BuildContext context,
//     {required String title,
//     required String buttonText,
//     required VoidCallback onTap}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         title,
//         style: const TextStyle(color: Colors.white, fontSize: 16),
//       ),
//       const SizedBox(height: 10),
//       OutlinedButton(
//         onPressed: onTap,
//         style: OutlinedButton.styleFrom(
//           side: const BorderSide(color: Colors.blue),
//           minimumSize: const Size(double.infinity, 40),
//         ),
//         child: Text(buttonText, style: const TextStyle(color: Colors.blue)),
//       ),
//     ],
//   );
// }
