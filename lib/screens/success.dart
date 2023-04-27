import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swadesh_interview/components/button.dart';
import 'package:swadesh_interview/screens/home.dart';

import '../state/beneficiary_provider.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final beneficiaryState = Provider.of<BeneficiaryState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        backgroundColor: const Color(0xff0A6CFF),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Success"),
              // Container(height: double.infinity),
              LongButton(
                  onPressed: () {
                    beneficiaryState.name = "";
                    beneficiaryState.bankAddress = "";
                    beneficiaryState.routingNum = "";
                    beneficiaryState.bankName = "";
                    beneficiaryState.beneficiaryNationality =
                        BeneficiaryNationality.american;
                    beneficiaryState.beneficiaryType = BeneficiaryType.business;
                    beneficiaryState.aadhar = null;
                    beneficiaryState.admissionLetter = null;
                    beneficiaryState.passport = null;
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  text: "Done")
            ]),
      ),
    );
  }
}
