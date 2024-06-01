import 'dart:convert';  // Add this import for json.decode
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/models/question_model.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';
import 'package:quize_app_bsp_tech/screen/splash/quize_screens/result_screen.dart';
import 'package:quize_app_bsp_tech/services/question_services.dart';
import 'package:quize_app_bsp_tech/widgets/custom_snackbar.dart';

class QuestionController extends GetxController {
  var loading = false.obs;
  var questionModel = QuestionsModel().obs;
   var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var selectedOption = ''.obs;
  var isLastQuestion = false.obs;
   var correctPredictions = 0.obs;

  getQuestions() async {
    try {
      loading.value = true;
      var res = await QuestionServices.getQuestions();
      print("Controller Response: $res");
      if (res is String) {
        res = json.decode(res);
      }
      if (res != false && res is Map<String, dynamic>) {
        questionModel.value = QuestionsModel.fromJson(res);
        debugPrint('object');
        loading.value = false;
      } else {
        printInfo(info: "Invalid response format");
        loading.value = false;
      }
    } on DioException catch (e) {
      loading.value = false;
      CustomSnackBar().errorSnackBar("Error");
      printInfo(info: e.response!.data.toString());
    } catch (e) {
      loading.value = false;
      printInfo(info: e.toString());
    }
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void checkAnswer() {
    var correctAnswer = questionModel.value.dATA!.questions![currentQuestionIndex.value].answer;
    print(correctAnswer);
    print(selectedOption);
    if (selectedOption.value == correctAnswer) {
      score += 30; // Example score increment
      correctPredictions++;
      print('Score'+score.toString());
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questionModel.value.dATA!.questions!.length - 1) {
      currentQuestionIndex++;
      selectedOption.value = '';
    } else {
// isLastQuestion.value = true;
      Get.toNamed(routeName.resultScreen);
    }
  }
}
