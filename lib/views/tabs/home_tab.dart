import 'package:equipilia/widgets/color.dart';
import 'package:equipilia/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData('Ksh', 1000, Colors.white),
      ChartData('Ksh', 500, const Color(0xFF7d70cd)),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0,),
            const SmallTextWidget(text: 'Welcome Lewis', fontWeight: FontWeight.w700, size: 22.0, color: AppColors.blackThemeColor,),
            const SizedBox(height: 20.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180.0,
                  width: size.width /2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryThemeColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SmallTextWidget(text: 'Profile strength', color: AppColors.whiteThemeColor, size: 16.0,),
                          ],
                        ),
                        const SizedBox(height: 10.0,),
                        Stack(
                          children: [
                            SizedBox(
                                height: 130,
                                width: 130,
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  removeBottom: true,
                                  child: SfCircularChart(
                                      margin: EdgeInsets.zero,
                                      series: <CircularSeries>[
                                        // Renders doughnut chart
                                        DoughnutSeries<ChartData, String>(
                                            dataSource: chartData,
                                            pointColorMapper:(ChartData data,  _) => data.color,
                                            xValueMapper: (ChartData data, _) => data.currency,
                                            yValueMapper: (ChartData data, _) => data.amount,
                                            innerRadius: '80%',
                                            radius: '80%'
                                        )
                                      ]
                                  ),
                                )
                            ),
                            const Positioned(
                              top: 60,
                              bottom: 60.0,
                              left: 50.0,
                              right: 50.0,
                              child: SmallTextWidget(text: '16%', color: AppColors.whiteThemeColor, size: 16, fontWeight: FontWeight.w700,),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  width: size.width /2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.whiteThemeColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SmallTextWidget(text: 'Jobs applied', color: AppColors.primaryThemeColor, size: 16.0,),
                          ],
                        ),
                        const SizedBox(height: 10.0,),
                        const SmallTextWidget(text: '8', color: AppColors.primaryThemeColor, size: 22, fontWeight: FontWeight.w700,),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class ChartData{
  final String currency;
  final Color color;
  final double amount;

  ChartData(this.currency, this.amount, this.color);

}