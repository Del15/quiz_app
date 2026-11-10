
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      children: summaryData.map(
        (data) {
          final isCorrect =
              data['user_answer'] == data['correct_answer'];

          return Row(
            children: [
              Text(
                ((data['question_index'] as int) + 1).toString(),
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontSize: 28,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['user_answer'] as String,
                      style: GoogleFonts.lato(
                        color: isCorrect
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    if (!isCorrect)
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
