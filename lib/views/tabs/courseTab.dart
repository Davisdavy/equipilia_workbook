import 'package:equipilia/widgets/color.dart';
import 'package:equipilia/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseTab extends StatefulWidget {
  const CourseTab({Key? key}) : super(key: key);

  @override
  State<CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTab> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0,),
              const SmallTextWidget(text: 'Job listing', fontWeight: FontWeight.w700, size: 22.0, color: AppColors.blackThemeColor,),
              const SizedBox(height: 20.0,),
              SizedBox(
                height: 25.0,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, size: 12.0,color: AppColors.secondaryThemeColor,),
                            SmallTextWidget(text: 'Latest', color: AppColors.secondaryThemeColor,),

                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Row(
                          children: [
                            Icon(Icons.arrow_downward, size: 12.0,),
                            SmallTextWidget(text: 'Saved'),

                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Row(
                          children: [
                            Icon(Icons.arrow_downward, size: 12.0,),
                            SmallTextWidget(text: 'Applied'),

                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.vertical(
                                  top: Radius.circular(12.0),
                                )),
                            builder: (_){
                              return StatefulBuilder(
                                builder: (context, setState){
                                  return Padding(
                                    padding:
                                    MediaQuery.of(context)
                                        .viewInsets,
                                    child: SizedBox(
                                      height: size.height / 2,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20.0,),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                const SizedBox(width: 10.0,),
                                                const SmallTextWidget(
                                                  text: 'Filter',
                                                  color: AppColors
                                                      .blackThemeColor,
                                                  size: 20.0,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child:
                                                      const Icon(
                                                        FontAwesomeIcons.xmark,
                                                        color:
                                                        AppColors.blackThemeColor,
                                                        size:
                                                        22.0,
                                                      )),
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const[
                          Icon(FontAwesomeIcons.sliders, size: 10.0,),
                          SizedBox(width: 5.0,),
                          SmallTextWidget(text: 'Filter')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: AppColors.fontHeaderColor.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
