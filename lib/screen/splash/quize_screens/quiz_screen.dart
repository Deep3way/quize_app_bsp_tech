import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize_app_bsp_tech/common/assets/index.dart';
import 'package:quize_app_bsp_tech/common/extension/spacing.dart';
import 'package:quize_app_bsp_tech/common/theme/app_css.dart';
import 'package:quize_app_bsp_tech/common/theme/colors.dart';
import 'package:quize_app_bsp_tech/controllers/question_controller.dart';
import 'package:quize_app_bsp_tech/widgets/custom_snackbar.dart';
import 'package:quize_app_bsp_tech/widgets/primary_button.dart';
import 'package:vibration/vibration.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuestionController questionController = Get.put(QuestionController());
  @override
  void initState() {
    questionController.getQuestions();
   questionController.loadScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFF5EFE8),
      //   elevation: 0,
      //   leading: Container(
      //     height: 50
      //     ,
      //     width: 80,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Row(
      //       children: [
      //         Icon(Icons.person, color: Colors.green),
      //         Text("20", style: TextStyle(color: Colors.black)),
      //       ],
      //     ),
      //   ),
      //   title: Text("Fantasy Quiz #156", style: TextStyle(color: Colors.black)),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.close, color: Colors.black),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      backgroundColor: ColorName.background,
      body: Obx(() {
        if (questionController.questionModel.value.dATA == null) {
          return const Center(child: CircularProgressIndicator());
        }
        var question = questionController.questionModel.value.dATA!
            .questions![questionController.currentQuestionIndex.value];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    // width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            eImageAssets.reward,
                            height: 20,
                            width: 20,
                          ),
                          const HSpace(5),
                          Text(questionController.totalScore.value.toString(), style: AppCss.montserrat18BoldBlack),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Fantasy Quiz #156',
                    style: AppCss.montserrat20MediumBlack,
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.close))
                ],
              ),
              const VSpace(20),
              Row(
                children: [
                  SizedBox(
                    height: 12,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: LinearProgressIndicator(
                      value: (questionController.currentQuestionIndex.value + 1) /
                          questionController
                              .questionModel.value.dATA!.questions!.length,
                      backgroundColor: ColorName.white,
                      color: Colors.green,
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    const HSpace(5),
                Text(
                  "${questionController.currentQuestionIndex.value + 1}/${questionController.questionModel.value.dATA!.questions!.length}",
                  style: const TextStyle(color: Colors.grey)),
                ],
              ),
            
             
              const VSpace(16),
              Text(
                question.question!,
                style: AppCss.montserrat20MediumBlack
              ),
              const VSpace(16),
              ...['A', 'B', 'C', 'D'].map((option) {
                String optionText;
                switch (option) {
                  case 'A':
                    optionText = question.ansA!;
                    break;
                  case 'B':
                    optionText = question.ansB!;
                    break;
                  case 'C':
                    optionText = question.ansC!;
                    break;
                  case 'D':
                    optionText = question.ansD!;
                    break;
                  default:
                    optionText = '';
                }
                return GestureDetector(
                  onTap: () {
                    questionController.selectOption(optionText);
                  },
                  child: Obx(() {
                    bool isSelected =
                        questionController.selectedOption.value == optionText;

                    return Card(
                      color: isSelected
                          ? ColorName.green.withOpacity(0.8)
                          : Colors.white,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                          children: [
                            questionController.selectedOption.value == option
                                ? Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Icon(Icons.check,
                                        color: ColorName.green))
                                : Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: ColorName.optionBAckgroundColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(child: Text(option)),
                                  ),
                            const HSpace(16),
                            SizedBox(
                              // color: Colors.black,
                              // height: 60,
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              child: Text(optionText,
                                  style:
                                      questionController.selectedOption.value ==
                                              option
                                          ? AppCss.montserrat20White
                                          : AppCss.montserrat20Black,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                          ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
              const Spacer(),
              Center(
                  child: PrimaryButton(
                buttonText: questionController.currentQuestionIndex.value < questionController.questionModel.value.dATA!.questions!.length - 1 == false ? 'FINISH' : 'CONTINUE',
                onClick: () {
                  if (questionController.selectedOption.value != '') {
                    questionController.checkAnswer();
                    questionController.nextQuestion();

                  } else {
                    CustomSnackBar().errorSnackBar('Please Select an option');
                    Vibration.vibrate();
                  }
                },
                isColors: true,
                Colors: questionController.selectedOption.value == ''
                    ? Colors.grey
                    : ColorName.green,
              )),
            ],
          ),
        );
      }),
    );
  }
}
