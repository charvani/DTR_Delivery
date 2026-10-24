import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/common_colors.dart';
import '../../../../utils/divider.dart';
import '../../../../utils/space_widget.dart';
import '../widgets/user_account_widgets.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_BG_COLOR,
      appBar: appBarWidget(
          title: "Privacy Policy",
          backNavigation: true,
          actions: [],
          centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Welcome to ',
                style: normalTextStyle,
              ),
              TextSpan(
                  text: 'Viswahita! ',
                  style: subHeadingStyle.copyWith(
                      fontFamily: "SemiBold", fontSize: 14.sp)
                  // style: TextStyle(
                  //     color: BLUE_COLOR, fontFamily: "SemiBold", fontSize: 14),
                  ),
              TextSpan(
                text:
                    "We respect your privacy and are committed to protecting your personal and business information."
                    "This Privacy Policy explains how we collect, use, disclose, and safeguard your data when you visit our website ",
                style: normalTextStyle,
              ),
              TextSpan(
                  text: '(www.viswahita.com)',
                  style: subHeadingStyle.copyWith(
                      fontFamily: "SemiBold", fontSize: 14.sp)),
              TextSpan(
                text: "or engage with our products and services.\n\n"
                    "By accessing our website, you consent to the data collection and practices described in this policy. If you do not agree, please refrain from using our services.",
                style: normalTextStyle,
              )
            ])),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "1. Information We Collect",
              style: headingStyle,
            ),
            SpaceWidget(height: 10),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "We collect both ",
                style: normalTextStyle,
              ),
              TextSpan(
                  text: 'personal ',
                  style: subHeadingStyle.copyWith(
                      fontFamily: "SemiBold", fontSize: 14.sp)),
              TextSpan(
                text: "and ",
                style: normalTextStyle,
              ),
              TextSpan(
                  text: 'business-related information  ',
                  style: subHeadingStyle.copyWith(
                      fontFamily: "SemiBold", fontSize: 14.sp)),
              TextSpan(
                text:
                    "to facilitate seamless transactions and improve our services.",
                style: normalTextStyle,
              ),
            ])),
            SpaceWidget(
              height: 10,
            ),
            Text("1.1 Business & Personal Information", style: subHeadingStyle),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "When you register, place an order, or contact us, we may collect:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint("Company Name"),
            bulletPoint("Business Type & Registration Details"),
            bulletPoint("Contact Person's Name"),
            bulletPoint("Email Address"),
            bulletPoint("Phone Number"),
            bulletPoint("Business Address & Shipping Information"),
            bulletPoint(
                "Payment Details (processed securely via third-party providers)"),
            SpaceWidget(height: 10),
            Text("1.2 Non-Personal & Technical Data", style: subHeadingStyle),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "To enhance user experience and optimize our website, we collect:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint("IP Address"),
            bulletPoint("Browser Type & Device Information"),
            bulletPoint(
                "Website Usage Analytics (Pages Visited, Time Spent, etc.)"),
            bulletPoint("Cookie Data & Tracking Information"),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "2. How We Use Your Information",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "We use the collected data to:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "Process Orders & Deliver Products: Ensure seamless order processing, shipping, and invoicing.",
                highlight: "Process Orders & Deliver Products"),
            bulletPoint(
                "Provide Customer Support: Address inquiries, technical support, and after-sales service.",
                highlight: "Provide Customer Support"),
            bulletPoint(
                "Enhance Website Functionality: Analyze user behavior for a better browsing experience.",
                highlight: "Enhance Website Functionality"),
            bulletPoint(
                "Marketing & Promotions: Send updates on new products, special offers, and industry insights (you may opt out at any time).",
                highlight: "Marketing & Promotions"),
            bulletPoint(
                "Legal Compliance: Fulfill regulatory obligations related to medical devices and business transactions.",
                highlight: "Legal Compliance"),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "3. Cookies & Tracking Technologies",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "Our website uses cookies and similar technologies to:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint("Store your preferences for a better user experience."),
            bulletPoint(
                "Track website performance and engagement through analytics tools."),
            bulletPoint("Enable secure login and transaction processes."),
            SpaceWidget(height: 5),
            Text(
                "You can adjust cookie settings through your browser preferences. However, disabling cookies may affect website functionality.",
                style: normalTextStyle),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "4. Data Sharing & Disclosure",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "We do not sell or rent your personal/business information. However, we may share data in the following circumstances:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "With Trusted Third-Party Service Providers: For payment processing, logistics, analytics, and IT security.",
                highlight: "With Trusted Third-Party Service Providers"),
            bulletPoint(
                "For Legal & Compliance Purposes: If required by law, regulatory authorities, or to protect our legal rights.",
                highlight: "For Legal & Compliance Purposes"),
            bulletPoint(
                "For Business Transactions: In case of mergers, acquisitions, or business restructuring, with prior notice.",
                highlight: "For Business Transactions"),
            SpaceWidget(height: 5),
            Text(
                "All third-party partners must adhere to strict data protection and confidentiality policies.",
                style: normalTextStyle),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "5. Data Security Measures",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "We implement industry-standard security protocols to protect your data, including:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "SSL Encryption: To secure online transactions and sensitive data.",
                highlight: "SSL Encryption"),
            bulletPoint(
                "Access Controls: Restricting data access to authorized personnel only.",
                highlight: "Access Controls"),
            bulletPoint(
                "Regular Security Audits: To prevent unauthorized access and cyber threats.",
                highlight: "Regular Security Audits"),
            SpaceWidget(height: 5),
            Text(
                "While we take reasonable precautions, no system is entirely foolproof. We advise users to keep their login credentials secure.",
                style: normalTextStyle),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "6. Your Rights & Choices",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 2,
            ),
            Text(
              "As a user, you have the right to:",
              style: normalTextStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "Access & Update Information: Modify your business or contact details as needed.",
                highlight: "Access & Update Information"),
            bulletPoint(
                "Opt-Out of Marketing Communications: Unsubscribe from promotional emails at any time.",
                highlight: "Opt-Out of Marketing Communications"),
            bulletPoint(
                "Request Data Deletion: Subject to applicable legal and regulatory requirements.",
                highlight: "Request Data Deletion"),
            SpaceWidget(height: 5),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "To exercise these rights, contact us at ",
                style: normalTextStyle,
              ),
              TextSpan(
                  text: 'connect@viswahita.com.',
                  style: subHeadingStyle.copyWith(
                      fontFamily: "SemiBold", fontSize: 14.sp)),
            ])),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "7. Third-Party Links",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "Our website may contain links to third-party websites. We are not responsible for their privacy policies or data practices. We recommend reviewing their policies before sharing information.",
                highlight: "not responsible",
                dot: false),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "8. Compliance with Industry Regulations",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "We comply with data protection laws applicable to the medical devices industry. If you have compliance-related concerns, please reach out to our Data Protection Officer at connect@viswahita.com.",
                highlight: "Data Protection Officer at connect@viswahita.com.",
                dot: false),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "9. Changes to This Privacy Policy",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            Text(
                "We may update this policy periodically. Changes will be posted on this page, and continued use of our website indicates acceptance of the updated terms.",
                style: normalTextStyle),
            SpaceWidget(
              height: 10,
            ),
            CommonDivider(),
            SpaceWidget(
              height: 10,
            ),
            Text(
              "10. Contact Us",
              style: headingStyle,
            ),
            SpaceWidget(
              height: 8,
            ),
            bulletPoint(
                "📍 H.NO: 5-9-262/35, 1st & 2nd Floor, Prashanth Nagar IDA, Hyderabad - 500037",
                // highlight: "",
                dot: false),
            SpaceWidget(
              height: 5,
            ),
            bulletPoint("📧 Email: connect@viswahita.com", dot: false
                // highlight: "",
                ),
            SpaceWidget(
              height: 5,
            ),
            bulletPoint("📞 Phone: +91 7386281105", dot: false),
            // highlight: "",

            SpaceWidget(
              height: 5,
            ),
            bulletPoint("🌐 Website: https://viswahita.com", dot: false),
            SpaceWidget(height: 40),
          ]),
        ),
      ),
    );
  }

  // Widget bulletPoint(String text) {
  //   return Padding(
  //     padding:  EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //          Text("• ", style: TextStyle(fontSize: 20)),
  //         Expanded(child: Text(text, style:  TextStyle(fontSize: 16))),
  //       ],
  //     ),
  //   );
  // }
}
