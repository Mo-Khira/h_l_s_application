import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/scan_helper.dart';
import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                  onPressed: () => GoRouter.of(context).pop(),
                ),
                SizedBox(height: kHeight(context) * 0.05),
                const CustomSearchBar(),
                SizedBox(height: kHeight(context) * 0.08),
                // ✅ Scan buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Meal
                    GestureDetector(
                      onTap: () => ScanHelper.scanMeal(context),
                      child: Container(
                        height: 125,
                        width: kWidth(context) * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kSecondaryColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.qr_code_scanner_rounded,
                                color: Colors.white, size: 50),
                            Text("Scan a Meal",
                                style: Styles.textStyle18
                                    .copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),

                    // Barcode
                    GestureDetector(
                      onTap: () => ScanHelper.scanBarcode(context),
                      child: Container(
                        height: 125,
                        width: kWidth(context) * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: kSecondaryColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.qr_code_scanner_rounded,
                                color: Colors.white, size: 50),
                            Text("Scan a Barcode",
                                style: Styles.textStyle18
                                    .copyWith(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w500)),
                    Row(
                      children: [
                        const Icon(Icons.history, color: Colors.white),
                        const SizedBox(width: 5),
                        Text("Most Recent",
                            style: Styles.textStyle18
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:h_l_s_application/constants.dart';
// import 'package:h_l_s_application/core/utils/styles.dart';
// import 'package:h_l_s_application/features/home/presentation/views/widgets/Home_view/widgets/custom_search_bar.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   Future<void> _scanMeal(BuildContext context) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final inputImage = InputImage.fromFilePath(pickedFile.path);
//       final labeler = ImageLabeler(
//         options: ImageLabelerOptions(confidenceThreshold: 0.5),
//       );
//       final labels = await labeler.processImage(inputImage);
//       labeler.close();

//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text("Meal Detected"),
//           content: Text(labels.map((e) => e.label).join(', ')),
//         ),
//       );
//     }
//   }

//   void _scanBarcode(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => Scaffold(
//           appBar: AppBar(
//             title: Text(
//               "Scan Barcode",
//               style: Styles.textStyle18,
//             ),
//           ),
//           body: MobileScanner(
//             onDetect: (capture) {
//               final barcode = capture.barcodes.first;
//               if (barcode.rawValue != null) {
//                 Navigator.of(context).pop();
//                 showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: const Text("Barcode Detected"),
//                     content: Text(barcode.rawValue ?? ''),
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 IconButton(
//                   padding: EdgeInsets.zero,
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 28,
//                   ),
//                   onPressed: () => GoRouter.of(context).pop(),
//                 ),
//                 SizedBox(height: kHeight(context) * 0.05),
//                 const CustomSearchBar(),
//                 SizedBox(height: kHeight(context) * 0.08),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // 🔍 Scan a Meal
//                     GestureDetector(
//                       onTap: () => _scanMeal(context),
//                       child: Container(
//                         height: 125,
//                         width: kWidth(context) * 0.43,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: kSecondaryColor),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             const Icon(Icons.qr_code_scanner_rounded,
//                                 color: Colors.white, size: 50),
//                             Text(
//                               "Scan a Meal",
//                               style: Styles.textStyle18
//                                   .copyWith(fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     // 📦 Scan a Barcode
//                     GestureDetector(
//                       onTap: () => _scanBarcode(context),
//                       child: Container(
//                         height: 125,
//                         width: kWidth(context) * 0.43,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: kSecondaryColor),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             const Icon(Icons.qr_code_scanner_rounded,
//                                 color: Colors.white, size: 50),
//                             Text(
//                               "Scan a Barcode",
//                               style: Styles.textStyle18
//                                   .copyWith(fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "History",
//                       style: Styles.textStyle18
//                           .copyWith(fontWeight: FontWeight.w500),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.history, color: Colors.white),
//                         const SizedBox(width: 5),
//                         Text(
//                           "Most Recent",
//                           style: Styles.textStyle18
//                               .copyWith(fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
