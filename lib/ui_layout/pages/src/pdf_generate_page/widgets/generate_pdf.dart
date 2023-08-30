// import 'package:flutter/material.dart';
// import 'package:business_layout/business_layout.dart';
// import 'package:models/models.dart';
// import '../../../../widgets_for_all_pages/widgets_for_all_pages.dart';
//
// class GeneratePdf extends StatelessWidget {
//   const GeneratePdf({super.key, required this.splitImageModel});
//
//   final SplitImageModel splitImageModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           children: [
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               primary: false,
//               shrinkWrap: true,
//               itemCount:splitImageModel.
//                   mapRowIndexAndListColor.keys.length,
//               itemBuilder: (BuildContext context, int indexRow) {
//                 return SizedBox(
//                   height: splitImageModel.sizePixel!.height.toDouble(),
//                   width: splitImageModel.sizePixel!.width.toDouble(),
//                   child: ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.zero,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: splitImageModel
//                             .mapRowIndexAndListColor[indexRow]?.length ??
//                         0,
//                     itemBuilder: (BuildContext context, int indexColumn) {
//                       return Padding(
//                         padding: const EdgeInsets.all(1.0),
//                         child: Container(
//                           width:
//                               splitImageModel.sizePixel!.width.toDouble(),
//                           height: splitImageModel.sizePixel!.height,
//                           color: splitImageModel
//                               .mapRowIndexAndListColor[indexRow]![indexColumn],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 100),
//             Text(
//               "Разметка",
//               style: myTextStyleFontOswald(
//                 context: context,
//                 fontSize: 24,
//               ),
//             ),
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               primary: false,
//               shrinkWrap: true,
//               itemCount:
//                   splitImageModel.mapRowIndexAndListColor.keys.length,
//               itemBuilder: (BuildContext context, int indexRow) {
//                 return SizedBox(
//                   height: 30,
//                   child: ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     padding: EdgeInsets.zero,
//                     scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: splitImageModel
//                             .mapRowIndexAndListColor[indexRow]?.length ??
//                         0,
//                     itemBuilder: (BuildContext context, int indexColumn) {
//                       return Padding(
//                         padding: const EdgeInsets.all(1.0),
//                         child: SizedBox(
//                           width: 50,
//                           height: 30,
//                           child: Text(
//                             "${indexRow}x$indexColumn",
//                             style: myTextStyleFontOswald(
//                               context: context,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
