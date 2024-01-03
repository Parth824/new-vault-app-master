import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/config/app_color.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/screens/PasswordPage/create_password_screen.dart';
import 'package:untitled/widgets/app_bar.dart';
import 'package:untitled/widgets/button_view.dart';
import 'package:untitled/widgets/toast.dart';


class SecurityQuestion extends StatefulWidget {
  const SecurityQuestion({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SecurityQuestionState createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  List<String> dropDownList = [
    "What was your childhood nickname?",
    "what is your father name?",
    "what is your birth month?",
    "what is your favourite actor?",
    "what is your favourite star?",
    "what is your favourite movie?",
    "what is your dream job?",
    "what is your sport hero?",
  ];
  String? dropVal;
  TextEditingController answer = TextEditingController();
  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(
          title: "Security Question", isBackIcon: true, context: context),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: DropdownButtonFormField<String>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                hint: const Text("Select"),
                value: dropVal,
                decoration: const InputDecoration(
                    errorBorder: InputBorder.none, border: InputBorder.none),
                isDense: true,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                onChanged: (value) {
                  dropVal = value;
                  setState(() {});
                },
                items:
                    dropDownList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColor.withOpacity(0.2),
              child: TextFormField(
                controller: answer,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    hintText: "Answer"),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          buttonView(
              title: "Save",
              onTap: () async {
                if (dropVal != null && answer.text.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  await SharePref.instance
                      .setString(SharePref.lockQuestion, dropVal!);
                  await SharePref.instance
                      .setString(SharePref.answer, answer.text);

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (context) => const CreatePasswordPage(),
                    ),
                  );
                } else {
                  showToast(context, "Enter value..");
                }
              })
        ],
      ),
    );
  }
}
