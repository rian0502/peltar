import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peltar/models/model_form_inspection.dart';

class FormInspectionViewModel extends ChangeNotifier {
  final ModelFormInspection _modelFormInspection = ModelFormInspection();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController idAsset = TextEditingController();
  String error = '';
  int id = 0;

  void setTypeInspection(String value){
    _modelFormInspection.typeInspection = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _modelFormInspection.description = value;
    notifyListeners();
  }

  void clearForm(){
    _modelFormInspection.image = '';
    _modelFormInspection.typeInspection = '';
    _modelFormInspection.description = '';
    descriptionController.clear();
    notifyListeners();
  }

  get image => _modelFormInspection.image;
  get description => _modelFormInspection.description;
  get typeInspection => _modelFormInspection.typeInspection;

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _modelFormInspection.image = pickedFile.path;
      notifyListeners();
    }
    notifyListeners();
  }

  bool validate() {
    if(descriptionController.text.isEmpty){
      error = 'Description cannot be empty';
      notifyListeners();
      return false;
    }
    if(_modelFormInspection.image.isEmpty){
      error = 'Image cannot be empty';
      notifyListeners();
      return false;
    }
    if(_modelFormInspection.typeInspection.isEmpty){
      error = 'Type Inspection cannot be empty';
      notifyListeners();
      return false;
    }
    notifyListeners();
    return true;
  }

  void simpan(){
    if(validate()){
      //print all variable
      print('Description : ${descriptionController.text}');
      print('Image : ${_modelFormInspection.image}');
      print('Type Inspection : ${_modelFormInspection.typeInspection}');
    }
  }


}
