import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swadesh_interview/components/button.dart';
import 'package:swadesh_interview/state/beneficiary_provider.dart';

import 'components/text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  String beneficiaryType = 'Business';
  String beneficiaryNationality = 'US';

  @override
  Widget build(BuildContext context) {
    final beneficiaryState = Provider.of<BeneficiaryState>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Get a Remittance'),
        backgroundColor: const Color(0xff0A6CFF),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Text(
                "Fill out the form below to start your remittence application -",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextField(
                        label: "Beneficiary Name",
                        onSave: (val) {
                          beneficiaryState.name = val;
                        },
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Name is required";
                          } else if (val.length < 3 || val.length > 50) {
                            return "Name must 3-50 characters long";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: DropdownButtonFormField(
                          items: ['Business', 'Family', 'University']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: beneficiaryType,
                          hint: const Text("Beneficiary Type"),
                          decoration: InputDecoration(
                            labelStyle:
                                const TextStyle(color: Color(0xff7B8794)),
                            labelText: "Beneficiary Type",
                            errorStyle: const TextStyle(fontSize: 16),
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Color(0xff0A6CFF)),
                            fillColor: const Color(0xffF5F7FA),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff0A6CFF)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 2, color: Color(0xffE4E7EB))),
                          ),
                          onChanged: (val) {
                            setState(() {
                              beneficiaryType = val ?? "";
                            });
                          },
                          onSaved: (val) {
                            beneficiaryState.beneficiaryType =
                                BeneficiaryType.values.firstWhere((element) =>
                                    element.toString().toLowerCase() ==
                                    'beneficiarytype.${beneficiaryType.toLowerCase()}');
                          },
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Beneficiary Type is required";
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: DropdownButtonFormField(
                          items: ['US', 'IN'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: beneficiaryNationality,
                          hint: const Text("Beneficiary Nationality"),
                          decoration: InputDecoration(
                            labelStyle:
                                const TextStyle(color: Color(0xff7B8794)),
                            labelText: "Beneficiary Nationality",
                            errorStyle: const TextStyle(fontSize: 16),
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Color(0xff0A6CFF)),
                            fillColor: const Color(0xffF5F7FA),
                            filled: true,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xff0A6CFF)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    width: 2, color: Color(0xffE4E7EB))),
                          ),
                          onChanged: (val) {
                            setState(() {
                              beneficiaryNationality = val ?? "";
                            });
                          },
                          onSaved: (val) {
                            if (beneficiaryNationality == "US") {
                              beneficiaryState.beneficiaryNationality =
                                  BeneficiaryNationality.american;
                            } else {
                              beneficiaryState.beneficiaryNationality =
                                  BeneficiaryNationality.indian;
                            }
                          },
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "Beneficiary Type is required";
                            }

                            return null;
                          },
                        ),
                      ),
                      InputTextField(
                          label: "Bank Name",
                          onSave: (val) {
                            beneficiaryState.bankName = val;
                          },
                          validate: (val) {
                            if (val!.isEmpty) {
                              return "Bank Name is required";
                            } else if (val.length < 3 || val.length > 50) {
                              return "Bank Name must 3-50 characters long";
                            }
                            return null;
                          }),
                      InputTextField(
                        label: "Routing Number",
                        onSave: (val) {
                          beneficiaryState.routingNum = val;
                        },
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Routing Number is required";
                          } else if (val.length != 9) {
                            return "Routing Number must be 9 digits long";
                          }
                        },
                        textInputType: TextInputType.number,
                      ),
                      InputTextField(
                        label: "Bank Address",
                        onSave: (val) {
                          beneficiaryState.bankAddress = val;
                        },
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Bank Address is required";
                          } else if (val.length < 3 || val.length > 200) {
                            return "Bank Address must be between 3-200 characters";
                          }
                        },
                        textInputType: TextInputType.multiline,
                      ),
                      LongButton(
                        text: "Continue",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
