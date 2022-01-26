import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/global/config.dart';
import 'package:flutter_project/models/API/question_response.dart';
import 'package:flutter_project/screens/Forum/forum_logic.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class QuestionAdd extends StatefulWidget {
  const QuestionAdd({Key? key}) : super(key: key);

  @override
  _QuestionAddState createState() => _QuestionAddState();
}

class _QuestionAddState extends State<QuestionAdd> {
  QuestionResponseModel? questionModel;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  //List<Object> images = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#1C3144"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.forum), SizedBox(width: 10), Text('Forum')],
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: productForm(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    questionModel = QuestionResponseModel();
  }

  Widget productForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Question",
              "Write your question here",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Question can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                questionModel!.question = onSavedVal,
              },
              initialValue: questionModel!.question ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Save",
              () {
                if (validateAndSave()) {
                  //print(questionModel!.toJson());

                  setState(() {
                    isApiCallProcess = true;
                  });

                  ForumService.saveProduct(
                    questionModel!,
                  ).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.of(context).pushNamed('/forum');
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Error occur",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: HexColor("#1C3144"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

isValidURL(url) {
  return Uri.tryParse(url)?.hasAbsolutePath ?? false;
}
