// import 'package:flutter/material.dart';

// class ReusableCard extends StatelessWidget {
//   ReusableCard({
//     @required this.name,
//     this.Theimage,
//   });

//   final String name;
//   final String Theimage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 135.0,
//       child: Column(
//         children: [
//           Container(
//               child: Image(
//             image: NetworkImage(Theimage == null
//                 ? 'https://www.comune.bustogarolfo.mi.it/it-it/immagine/img-141941-M2-29-1354-0-0-138376bbd803562399b44f9e141b059d'
//                 : Theimage),
//           ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Text(
//               '$name',
//               style: TextStyle(),
//             ),
//           ),
//         ],
//       ),
//       margin: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     );
//   }
// }
