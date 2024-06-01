// views/result_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/common/assets/index.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';
import 'package:quize_app_bsp_tech/controllers/question_controller.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';
import 'package:quize_app_bsp_tech/screen/splash/quize_screens/quiz_screen.dart';
import 'package:quize_app_bsp_tech/widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  final QuestionController questionController = Get.find();

  @override
  Widget build(BuildContext context) {
    int scoreGained = questionController.score.value * 30; 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Get.offAll(() => QuizScreen()); // Replace with your main screen
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFF5EFE8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(eImageAssets.gift), 
            SizedBox(height: 20),
            Text(
              "Results of Fantasy Quiz",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        "SCORE GAINED",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "$scoreGained",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: ColorName.gray,thickness: 0.5,),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        "CORRECT PREDICTIONS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        questionController.correctPredictions.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            // ElevatedButton(
            //   onPressed: () {
            //     questionController.score.value = 0;
            //     questionController.currentQuestionIndex.value = 0;
            //     questionController.getQuestions();
            //     Get.offAll(() => QuizScreen()); // Replace with your main screen
            //   },
            //   child: Text(
            //     "OKAY",
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green,
            //     minimumSize: Size(double.infinity, 50), // full-width button
            //   ),
            // ),
            PrimaryButton(buttonText: 'OKAY',
            isColors: true,
            Colors: ColorName.green,
             onClick: () {
                 questionController.score.value = 0;
                questionController.currentQuestionIndex.value = 0;
                questionController.getQuestions();
                Get.offAll(routeName.quizScreen);
            })
          ],
        ),
      ),
    );
  }
}
