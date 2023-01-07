import 'package:equipilia/widgets/color.dart';
import 'package:equipilia/widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CareersTab extends StatefulWidget {
  const CareersTab({Key? key}) : super(key: key);

  @override
  State<CareersTab> createState() => _CareersTabState();
}

class _CareersTabState extends State<CareersTab> {
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
               const SizedBox(height: 10.0,),
              SizedBox(
                height: size.height,
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(18, (index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 120.0,
                          width: size.width,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:  [
                                    SizedBox(
                                      //width: size.width  / 1.8,
                                      child: const SmallTextWidget(text: 'Software Sales & Support Executive',
                                        fontWeight: FontWeight.w700,
                                        size: 16.0,
                                        align: TextAlign.start,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: AppColors.blackThemeColor,),
                                    ),
                                   const SizedBox(height: 8.0,),
                                    SizedBox(
                                      width: 200,
                                      child: SmallTextWidget(text: 'Digital Frameworks Ltd',
                                        fontWeight: FontWeight.w700,
                                        size: 14.0,
                                        align: TextAlign.start,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: AppColors.fontHeaderColor,),
                                    ),
                                    SizedBox(height: 8.0,),
                                    SizedBox(
                                      //width: 200,
                                      child: SmallTextWidget(text: 'Nairobi | Fulltime | Salary: Ksh45,000',
                                        fontWeight: FontWeight.w700,
                                        size: 14.0,
                                        align: TextAlign.start,
                                        textOverflow: TextOverflow.ellipsis,
                                        color: AppColors.fontHeaderColor,),
                                    ),
                                    SizedBox(height: 15.0,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SmallTextWidget(text: '5 months ago',
                                          fontWeight: FontWeight.w700,
                                          size: 10.0,
                                          align: TextAlign.start,
                                          textOverflow: TextOverflow.ellipsis,
                                          color: AppColors.blackThemeColor,),
                                        const SizedBox(width: 10.0,),
                                        Icon(Icons.favorite_border, color: AppColors.fontHeaderColor, size: 18.0,),
                                        const SizedBox(width: 12.0,),
                                        Image.asset('assets/icons/share.png', height: 19.0,),
                                        const SizedBox(width: 12.0,),
                                        SmallTextWidget(text: 'Apply', size: 18.0, fontWeight: FontWeight.w700, color: AppColors.secondaryThemeColor,)

                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                         Divider(
                          color: AppColors.fontHeaderColor.withOpacity(0.4),
                        )
                      ],
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
