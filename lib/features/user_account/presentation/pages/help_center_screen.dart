import 'package:flutter/material.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/common_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          title: "Help Center",
          backNavigation: true,
          actions: [],
          centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                bulletPoint(
                    "📍 H.NO: 5-9-262/35, 1st & 2nd Floor, Prashanth Nagar IDA, Hyderabad - 500037",
                    highlight: ".",
                    dot: false),
                bulletPoint("📧 Email: connect@viswahita.com",
                    highlight: ".", dot: false),
                bulletPoint("📞 Phone: +91 7386281105",
                    highlight: ":", dot: false),
                bulletPoint("🌐 Website: https://viswahita.com", dot: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bulletPoint(String text, {String? highlight, bool? dot}) {
    final style = const TextStyle(fontSize: 14, color: Colors.black87);
    if (highlight != null && text.contains(highlight)) {
      final parts = text.split(highlight);
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dot == false
                ? SizedBox.shrink()
                : const Text("• ", style: TextStyle(fontSize: 14)),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: style.copyWith(color: Colors.black87),
                  children: [
                    TextSpan(text: parts[0], style: TextStyle(fontSize: 14)),
                    TextSpan(
                      text: highlight,
                      style: style.copyWith(
                          color: BLUE_COLOR,
                          fontFamily: "SemiBold",
                          fontSize: 14),
                    ),
                    TextSpan(text: parts.length > 1 ? parts[1] : ''),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dot == false
              ? SizedBox.shrink()
              : const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(child: Text(text, style: style)),
        ],
      ),
    );
  }
}
