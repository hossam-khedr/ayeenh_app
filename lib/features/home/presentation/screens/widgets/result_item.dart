import 'package:ayeenh/core/utilities/app_styles.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class ResultItem extends StatefulWidget {
  const ResultItem({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          SizedBox(
            height: 80.h,
            width: 200.w,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: true),
                minX: 0,
                maxX: 7,
                minY: 2,
                maxY: 7,
                lineBarsData: [
                  LineChartBarData(
                    spots:const [
                      FlSpot(0, 5),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    color: AppColors.gryColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          Column(
          children: [
            indicator(
              color: AppColors.bluColor,
              text: 'some text',
            ),
            SizedBox(height: 5.h,),
            indicator(
              color: AppColors.success,
              text: 'some text',
            ),
            SizedBox(height: 5.h,),
            indicator(
              color: AppColors.warning,
              text: 'some text',
            ),
            SizedBox(height: 5.h,),
            indicator(
              color: AppColors.favorite,
              text: 'some text',
            ),
          ],
        ),
      ]
      ),
    );
    // return AspectRatio(
    //   aspectRatio: 1.3,
    //   child: Row(
    //     children: <Widget>[
    //       const SizedBox(
    //         height: 18,
    //       ),
    //       Expanded(
    //         child: AspectRatio(
    //           aspectRatio: 1,
    //           child: PieChart(
    //             PieChartData(
    //               pieTouchData: PieTouchData(
    //                 touchCallback: (FlTouchEvent event, pieTouchResponse) {
    //                   setState(() {
    //                     if (!event.isInterestedForInteractions ||
    //                         pieTouchResponse == null ||
    //                         pieTouchResponse.touchedSection == null) {
    //                       touchedIndex = -1;
    //                       return;
    //                     }
    //                     touchedIndex = pieTouchResponse
    //                         .touchedSection!.touchedSectionIndex;
    //                   });
    //                 },
    //               ),
    //               borderData: FlBorderData(
    //                 show: false,
    //               ),
    //               sectionsSpace: 0,
    //               centerSpaceRadius: 40,
    //               sections: showingSections(),
    //             ),
    //           ),
    //         ),
    //       ),
    //       // const Column(
    //       //   mainAxisAlignment: MainAxisAlignment.end,
    //       //   crossAxisAlignment: CrossAxisAlignment.start,
    //       //   children: <Widget>[
    //       //     Indicator(
    //       //       color: AppColors.contentColorBlue,
    //       //       text: 'First',
    //       //       isSquare: true,
    //       //     ),
    //       //     SizedBox(
    //       //       height: 4,
    //       //     ),
    //       //     Indicator(
    //       //       color: AppColors.contentColorYellow,
    //       //       text: 'Second',
    //       //       isSquare: true,
    //       //     ),
    //       //     SizedBox(
    //       //       height: 4,
    //       //     ),
    //       //     Indicator(
    //       //       color: AppColors.contentColorPurple,
    //       //       text: 'Third',
    //       //       isSquare: true,
    //       //     ),
    //       //     SizedBox(
    //       //       height: 4,
    //       //     ),
    //       //     Indicator(
    //       //       color: AppColors.contentColorGreen,
    //       //       text: 'Fourth',
    //       //       isSquare: true,
    //       //     ),
    //       //     SizedBox(
    //       //       height: 18,
    //       //     ),
    //       //   ],
    //       // ),
    //       const SizedBox(
    //         width: 28,
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget indicator(
      {required Color color, required String text, }) {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 15.h,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(width: 7.w),
        Text(
          text,
          style: AppStyles.subTitleStyle().copyWith(color: AppColors.darkGryColor),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 16.0 : 12.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.bluColor,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.whitColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.success,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.whitColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.warning,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.whitColor,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.favorite,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.whitColor,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
