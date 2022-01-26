import 'dart:io';
import 'dart:ui';
import 'package:flutter_project/global/config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_project/models/API/flats_response_model.dart';
import 'package:flutter_project/screens/Flats/flats_logic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class FlatsAdd extends StatefulWidget {
  const FlatsAdd({Key? key}) : super(key: key);

  @override
  _FlatsAddState createState() => _FlatsAddState();
}

class _FlatsAddState extends State<FlatsAdd> {
  FlatsResponseModel? flatsModel;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;
  List<Object> images = [];
  bool isEditMode = false;
  bool isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#1C3144"),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bedroom_child_outlined),
                  SizedBox(width: 10),
                  Text(
                    'Add yours',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
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
    flatsModel = FlatsResponseModel();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        flatsModel = arguments['model'];
        isEditMode = true;
        setState(() {});
      }
    });
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
              "Creator",
              "Owner's name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'The name can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                flatsModel!.creator = onSavedVal,
              },
              initialValue: flatsModel!.creator ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Address",
              "Address",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'The address can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                flatsModel!.address = onSavedVal,
              },
              initialValue: flatsModel!.address ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "FlatName",
              "Apartment Title",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'The title can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                flatsModel!.name = onSavedVal,
              },
              initialValue: flatsModel!.name ?? "",
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Price",
              "Price per month",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Price can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                flatsModel!.price = int.parse(onSavedVal),
              },
              initialValue:
                  flatsModel!.price == null ? "" : flatsModel!.price.toString(),
              obscureText: false,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
              suffixIcon: const Icon(Icons.monetization_on),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: FormHelper.inputFieldWidget(
              context,
              const Icon(Icons.person),
              "Description",
              "Description",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'The description can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                flatsModel!.description = onSavedVal,
              },
              initialValue: flatsModel!.description ?? "",
              obscureText: false,
              isMultiline: true,
              borderFocusColor: Colors.black,
              borderColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,
            ),
          ),
          picPicker(
            isImageSelected,
            flatsModel!.picture ?? "",
            (file) => {
              setState(
                () {
                  //model.productPic = file.path;
                  flatsModel!.picture = file.path;
                  isImageSelected = true;
                },
              )
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Save",
              () {
                if (validateAndSave()) {
                  print(flatsModel!.toJson());

                  setState(() {
                    isApiCallProcess = true;
                  });

                  FlatsService.saveProduct(
                    flatsModel!,
                    isEditMode,
                    isImageSelected,
                  ).then(
                    (response) {
                      setState(() {
                        isApiCallProcess = false;
                      });

                      if (response) {
                        Navigator.of(context).pushNamed('/flats');
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

  static Widget picPicker(
    bool isImageSelected,
    String fileName,
    Function onFilePicked,
  ) {
    Future<XFile?> _imageFile;
    ImagePicker _picker = ImagePicker();

    return Column(
      children: [
        fileName.isNotEmpty
            ? isImageSelected
                ? Image.file(
                    File(fileName),
                    width: 300,
                    height: 300,
                  )
                : SizedBox(
                    child: Image.network(
                      fileName,
                      width: 200,
                      height: 200,
                      fit: BoxFit.scaleDown,
                    ),
                  )
            : SizedBox(
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.scaleDown,
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.image, size: 35.0),
                onPressed: () {
                  _imageFile = _picker.pickImage(source: ImageSource.gallery);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                icon: const Icon(Icons.camera, size: 35.0),
                onPressed: () {
                  _imageFile = _picker.pickImage(source: ImageSource.camera);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  isValidURL(url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}
