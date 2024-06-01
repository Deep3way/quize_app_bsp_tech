import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/models/question_model.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';
import 'package:quize_app_bsp_tech/services/question_services.dart';
import 'package:quize_app_bsp_tech/widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class QuestionController extends GetxController {
  var loading = false.obs;
  var questionModel = QuestionsModel().obs;
  var currentQuestionIndex = 0.obs;
  var score = 0.obs;
  var selectedOption = ''.obs;
  var isLastQuestion = false.obs;
  var correctPredictions = 0.obs;
  var totalScore = 0.obs;

  getQuestions() async {
    try {
      loading.value = true;
      var res = await QuestionServices.getQuestions();
    debugPrint("Controller Response: $res");
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
    var correctAnswer =
        questionModel.value.dATA!.questions![currentQuestionIndex.value].answer;
    debugPrint(correctAnswer);
    debugPrint(selectedOption.toString());
    if (selectedOption.value == correctAnswer) {
      score += 30; // Example score increment
      correctPredictions++;
      debugPrint('Score$score');
    }
  }

  Future<void> nextQuestion() async {
    if (currentQuestionIndex.value <
        questionModel.value.dATA!.questions!.length - 1) {
      currentQuestionIndex++;
      selectedOption.value = '';
    } else {
// isLastQuestion.value = true;
      await saveScore();
      Vibration.vibrate();
      Get.toNamed(routeName.resultScreen);
    }
  }

  Future<void> saveScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', score.value);
    debugPrint('Score Stored in local');
  }

  Future<void> loadScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    score.value = prefs.getInt('score') ?? 0;
    totalScore.value = score.value;
    debugPrint('object:${prefs.getInt('score')}');
  }
}
