// views/result_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/common/assets/index.dart';
import 'package:quize_app_bsp_tech/common/extension/spacing.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';
import 'package:quize_app_bsp_tech/common/theme/index.dart';
import 'package:quize_app_bsp_tech/controllers/question_controller.dart';
import 'package:quize_app_bsp_tech/routes/index.dart';
import 'package:quize_app_bsp_tech/widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  final QuestionController questionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
         Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.close)),
                      HSpace(20)
        ],
      ),
      backgroundColor: ColorName.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(eImageAssets.gift,height: 140), 
           VSpace(20),
            Text(
              "Results of Fantasy Quiz",
              style: AppCss.montserrat20MediumBlack
            ),
            VSpace(30),
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
                       Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: 
                      Image.asset(eImageAssets.money)), 
                      HSpace(10),
                      Text(
                        "SCORE GAINED",
                         style: AppCss.montserrat18BoldBlack
                      ),
                      Spacer(),
                      Text(
                        questionController.score.value.toString(),
                        style: AppCss.montserrat18BoldBlack
                      ),
                    ],
                  ),
                  Divider(color: ColorName.gray,thickness: 0.5,),
                  Row(
                    children: [
                    
                                 Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: ColorName.optionBAckgroundColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Icon(Icons.check,
                                        color: ColorName.green)),
                     HSpace(10),
                      Text(
                        "CORRECT PREDICTIONS",
                        style: AppCss.montserrat18BoldBlack
                      ),
                      Spacer(),
                      Text(
                        questionController.correctPredictions.value.toString(),
                        style: AppCss.montserrat18BoldBlack
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            PrimaryButton(buttonText: 'OKAY',
            isColors: true,
            Colors: ColorName.green,
             onClick: () {
            
                 questionController.score.value = 0;
                questionController.currentQuestionIndex.value = 0;
                questionController.getQuestions();
                Get.offAllNamed(routeName.quizScreen);
            })
          ],
        ),
      ),
    );
  }
}
