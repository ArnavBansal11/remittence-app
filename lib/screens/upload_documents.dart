import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:swadesh_interview/components/button.dart';
import 'package:swadesh_interview/screens/success.dart';
import 'package:swadesh_interview/state/beneficiary_provider.dart';

import '../components/file_picker.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    final beneficiaryState = Provider.of<BeneficiaryState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload your documents"),
        backgroundColor: const Color(0xff0A6CFF),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const Text(
              "Upload the following documents to complete your application",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 12,
            ),
            FilePickerWidget(
              label: "National Identity (Aadhar)",
              file: beneficiaryState.aadhar,
              onPick: (file) {
                beneficiaryState.aadhar = file;
              },
            ),
            FilePickerWidget(
              label: "Passport",
              file: beneficiaryState.passport,
              onPick: (file) {
                beneficiaryState.passport = file;
              },
            ),
            beneficiaryState.beneficiaryType == BeneficiaryType.university
                ? FilePickerWidget(
                    label: "University Admission Letter",
                    file: beneficiaryState.admissionLetter,
                    onPick: (file) {
                      beneficiaryState.admissionLetter = file;
                    },
                  )
                : Container(),
            LongButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SuccessPage()));
              },
              text: "Submit",
              disabled: beneficiaryState.aadhar == null ||
                  beneficiaryState.passport == null ||
                  (beneficiaryState.beneficiaryType ==
                          BeneficiaryType.university &&
                      beneficiaryState.admissionLetter == null),
            )
          ],
        ),
      )),
    );
  }
}
