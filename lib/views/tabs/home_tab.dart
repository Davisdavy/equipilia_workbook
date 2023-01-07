import 'package:equipilia/widgets/color.dart';
import 'package:equipilia/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              const SmallTextWidget(text: 'Welcome Lewis', fontWeight: FontWeight.w700, size: 22.0, color: AppColors.blackThemeColor,),
              const SizedBox(height: 20.0,),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SizedBox(
                    child: StaggeredGridView.count(
                      crossAxisCount: 4,
                      physics: const BouncingScrollPhysics(),
                      staggeredTiles: const [
                        StaggeredTile.count(2, 2.7),
                        StaggeredTile.count(2, 2),
                        StaggeredTile.count(2, 2.5),
                        StaggeredTile.count(2, 1.5),

                      ],
                      mainAxisSpacing: 4.0,
                      shrinkWrap: true,
                      crossAxisSpacing: 15.0,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryThemeColor,
                              border: Border.all(
                                  color: AppColors.fontHeaderColor.withOpacity(0.2), width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                   SmallTextWidget(
                                    text: "Profile strength",
                                    color: AppColors.whiteThemeColor,
                                    fontWeight: FontWeight.w400,
                                    size: 18.0,
                                  ),
                                   SizedBox(width: 40.0),

                                ],
                              ),
                              Stack(
                                children: [
                                  Center(
                                      child: SizedBox(
                                          height: 160,
                                          width: 160,
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
                                      )
                                  ),
                                  const Positioned(
                                    bottom: 60,
                                    top: 60.0,
                                    right: 50.0,
                                    left: 50.0,
                                    child: SmallTextWidget(text: "40%", color: AppColors.whiteThemeColor, size: 20.0, fontWeight: FontWeight.w700,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteThemeColor,
                              border: Border.all(
                                  color: AppColors.fontHeaderColor.withOpacity(0.2), width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SmallTextWidget(
                                        text: "Jobs",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                      const SizedBox(height: 5.0,),
                                      const SmallTextWidget(
                                        text: "Applied",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40.0),
                                  Icon(
                                    FontAwesomeIcons.coins,
                                    color: Colors.red.withOpacity(0.6),
                                  )
                                ],
                              ),

                              const SizedBox(height: 40.0,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallTextWidget(text: "5", size: 24.0, fontWeight: FontWeight.w700,),
                                    const SizedBox(height: 5.0,),
                                    SmallTextWidget(text: "2 viewed", color: AppColors.fontHeaderColor.withOpacity(0.6), size: 12.0,),
                                    SmallTextWidget(text: "3 not viewed", color: AppColors.fontHeaderColor.withOpacity(0.6), size: 12.0, fontWeight: FontWeight.w500,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteThemeColor,
                              border: Border.all(
                                  color: AppColors.fontHeaderColor.withOpacity(0.2), width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                       SmallTextWidget(
                                        text: "eBooks",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                       SmallTextWidget(
                                        text: "Purchased",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40.0),
                                  Icon(
                                    FontAwesomeIcons.basketShopping,
                                    color: Colors.green.withOpacity(0.6),
                                  )
                                ],
                              ),

                              const SizedBox(height: 28.0,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   const SmallTextWidget(text: "1", size: 24.0, fontWeight: FontWeight.w700,),
                                    const SizedBox(height: 5.0,),
                                    const SizedBox(height: 20.0,),

                                    Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteThemeColor,
                                        border: Border.all(color: AppColors.blackThemeColor),
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.black.withOpacity(0.4),
                                        onTap: (){


                                        },
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              SmallTextWidget(text: "View", size: 16.0,color: AppColors.blackThemeColor,),
                                              Icon(Icons.arrow_forward, color: AppColors.blackThemeColor, size: 18.0,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.whiteThemeColor,
                              border: Border.all(
                                  color: AppColors.fontHeaderColor.withOpacity(0.2), width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                       SmallTextWidget(
                                        text: "eBooks",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                       SmallTextWidget(
                                        text: "Published",
                                        color: AppColors.fontHeaderColor,
                                        fontWeight: FontWeight.w400,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 40.0),
                                  Icon(
                                    FontAwesomeIcons.productHunt,
                                    color: Colors.blue.withOpacity(0.6),
                                  )
                                ],
                              ),

                              const SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallTextWidget(text: "0", color: AppColors.blackThemeColor, size: 24.0, fontWeight: FontWeight.w700,),
                                        const SizedBox(height: 5.0,),
                                        SmallTextWidget(text: "published", color: AppColors.fontHeaderColor.withOpacity(0.6), size: 12.0,),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallTextWidget(text: "published", color: AppColors.fontHeaderColor.withOpacity(0.6), size: 12.0,),
                                        const SizedBox(height: 5.0,),
                                        SmallTextWidget(text: "Unpublished", color: AppColors.fontHeaderColor.withOpacity(0.6), size: 12.0,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ),
              const SizedBox(height: 20.0,),
              const SmallTextWidget(text: 'Top Courses',
                fontWeight: FontWeight.w400,
                size: 18.0,
                color: AppColors.blackThemeColor,),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 160.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 140,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/is.jpg'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          const SmallTextWidget(
                            text: 'Information System Audit',
                            fontWeight: FontWeight.w500,
                            textOverflow: TextOverflow.ellipsis,
                            size: 10.0,
                            color: AppColors.blackThemeColor,),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   SmallTextWidget(text: 'Recommended Courses',
                    fontWeight: FontWeight.w400,
                    size: 18.0,
                    color: AppColors.blackThemeColor,),
                   SmallTextWidget(text: 'More',
                    fontWeight: FontWeight.w400,
                    size: 18.0,
                    color: AppColors.secondaryThemeColor,),
                ],
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 120.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0,),
                      child: Container(
                        height: 120,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.whiteThemeColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/is.jpg'),
                                    fit: BoxFit.cover
                                  )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    width: 180,
                                    child: SmallTextWidget(text: 'System Information Audit',
                                      fontWeight: FontWeight.w700,
                                      size: 16.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.blackThemeColor,),
                                  ),
                                   SizedBox(height: 5.0,),
                                  SizedBox(
                                    width: 160,
                                    child: SmallTextWidget(text: 'Ksh 1,000',
                                      fontWeight: FontWeight.w700,
                                      size: 14.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.fontHeaderColor,),
                                  ),
                                  SizedBox(height: 5.0,),
                                  SizedBox(
                                    width: 160,
                                    child: SmallTextWidget(text: '5 months ago',
                                      fontWeight: FontWeight.w700,
                                      size: 14.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.blackThemeColor,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SmallTextWidget(text: 'Vacancies',
                    fontWeight: FontWeight.w400,
                    size: 18.0,
                    color: AppColors.blackThemeColor,),
                  SmallTextWidget(text: 'More',
                    fontWeight: FontWeight.w400,
                    size: 18.0,
                    color: AppColors.secondaryThemeColor,),
                ],
              ),
              const SizedBox(height: 10.0,),
              SizedBox(
                height: 120.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0,),
                      child: Container(
                        height: 120,
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.whiteThemeColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                              child: Container(
                                height: 100,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/images/is.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    width: 180,
                                    child: SmallTextWidget(text: 'System Information Audit',
                                      fontWeight: FontWeight.w700,
                                      size: 16.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.blackThemeColor,),
                                  ),
                                  SizedBox(height: 5.0,),
                                  SizedBox(
                                    width: 160,
                                    child: SmallTextWidget(text: 'Ksh 1,000',
                                      fontWeight: FontWeight.w700,
                                      size: 14.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.fontHeaderColor,),
                                  ),
                                  SizedBox(height: 5.0,),
                                  SizedBox(
                                    width: 160,
                                    child: SmallTextWidget(text: '5 months ago',
                                      fontWeight: FontWeight.w700,
                                      size: 14.0,
                                      align: TextAlign.start,
                                      textOverflow: TextOverflow.ellipsis,
                                      color: AppColors.blackThemeColor,),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
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