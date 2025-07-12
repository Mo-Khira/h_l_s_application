import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:h_l_s_application/constants.dart';
import 'package:h_l_s_application/core/utils/styles.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/scan_helper.dart';
import 'package:h_l_s_application/features/home/presentation/views/Home_view/widgets/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {});
    });
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildScanButton(
                        label: "Scan a Meal",
                        onTap: () async {
                          final result = await ScanHelper.scanMeal(context);
                          if (result != null) {
                            setState(() {
                              ScanHelper.addToHistory("Meal: \n$result");
                              Navigator.of(context)
                                  .pop(result); // يرجّع النتيجة لـ DiaryView
                            });
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Meal Detected"),
                                content: Text(result),
                              ),
                            );
                          }
                        }),
                    _buildScanButton(
                        label: "Scan a Barcode",
                        onTap: () async {
                          final result = await ScanHelper.scanBarcode(context);
                          if (result != null) {
                            setState(() {
                              ScanHelper.addToHistory("Product:\n$result");
                              Navigator.of(context).pop(result);
                            });
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Product Info"),
                                content: Text(result),
                              ),
                            );
                          }
                        }),
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
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (ScanHelper.scanHistory.isEmpty)
                  Text("No scan history yet.",
                      style:
                          Styles.textStyle16.copyWith(color: Colors.grey[400]))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ScanHelper.scanHistory.length,
                    itemBuilder: (context, index) {
                      final entry = ScanHelper.scanHistory[index];
                      return Card(
                        color: Colors.black54,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            entry,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScanButton(
      {required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
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
            Text(label,
                style:
                    Styles.textStyle18.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     // تحديث تلقائي بعد الرجوع من سكان
//     Future.delayed(Duration(milliseconds: 200), () {
//       setState(() {});
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
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
//                   icon: const Icon(Icons.arrow_back,
//                       color: Colors.white, size: 28),
//                   onPressed: () => GoRouter.of(context).pop(),
//                 ),
//                 SizedBox(height: kHeight(context) * 0.05),
//                 const CustomSearchBar(),
//                 SizedBox(height: kHeight(context) * 0.08),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () => ScanHelper.scanMeal(context),
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
//                             Text("Scan a Meal",
//                                 style: Styles.textStyle18
//                                     .copyWith(fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () => ScanHelper.scanBarcode(context),
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
//                             Text("Scan a Barcode",
//                                 style: Styles.textStyle18
//                                     .copyWith(fontWeight: FontWeight.w500)),
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
//                     Text("History",
//                         style: Styles.textStyle18
//                             .copyWith(fontWeight: FontWeight.w500)),
//                     Row(
//                       children: [
//                         const Icon(Icons.history, color: Colors.white),
//                         const SizedBox(width: 5),
//                         Text("Most Recent",
//                             style: Styles.textStyle18
//                                 .copyWith(fontWeight: FontWeight.w500)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 ...ScanHelper.scanHistory.map((entry) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: Text(
//                         '• $entry',
//                         style: Styles.textStyle16
//                             .copyWith(color: Colors.grey[300]),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
