import 'package:flutter/material.dart';
import 'package:ramadantime/res/colors/app_color.dart';
class DuaScreen extends StatefulWidget {
  const DuaScreen({Key? key}) : super(key: key);

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.appColor,
      iconTheme: IconThemeData(color: AppColor.fontColor),
      title: const Text(
        'দোয়া',
        style: TextStyle(color: AppColor.fontColor),
      ),
      centerTitle: true,),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('রোজার নিয়ত',style:  TextStyle(
                color: AppColor.appColor,
                fontSize:18,
                fontWeight: FontWeight.w600),),
            SizedBox(height: 6,),
            Center(
              child: Text("نويت أن أصومَ غَدًا مَنْ شهر رمضانَ الْمُبَارَكِ فَرْضًا لَكَ يَا اللَّهُ فَتَقَبَّلَ مِنِّي إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيم",textAlign: TextAlign.center, style:  TextStyle(
                  color: AppColor.appColor,
                  fontSize:16,
                  fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 8,),
            Text('উচ্চারণ:- নাওয়াইতু আন আসুমা গাদাম মিন শাহরি রামদ্বানাল মুবারাকি ফারদাল্লাকা, ইয়া আল্লাহু ফাতাকাব্বাল মিন্নি ইন্নিকা আনতাস সামিউল আলিম।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 8,),
            Text('অর্থ - হে আল্লাহ! আমি আগামীকাল পবিত্র রমজানের তোমার পক্ষ থেকে নির্ধারিত ফরজ রোজা রাখার ইচ্ছা পোষণ (নিয়্যত) করছি। অতএব তুমি আমাকে কবুল কর, নিশ্চয়ই তুমি সর্বশ্রোতা ও সর্বজ্ঞানী।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize: 16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 15,),
            Text('ইফতারের আগে',style:  TextStyle(
                color: AppColor.appColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),),
            SizedBox(height: 6,),
            Text('ইফতারের সময় দোয়া কবুল হয়। তাই এ সময় বেশি বেশি দোয়া-ইস্তিগফার করা উচিত বিশেষত এই দোয়াটির আমল করা যেতে পারে।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:14,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 8,),
            Center(
              child: Text("اللَّهُمَّ إِنِّي أَسْأَلُكَ بِرَحْمَتِكَ الَّتِي وَسِعَتْ كُلَّ شَيْءٍ أَنْ تَغْفِرَ لِي", style:  TextStyle(
                  color: AppColor.appColor,
                  fontSize:16,
                  fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 8,),
            Text('উচ্চারণ : আল্লাহুম্মা ইন্নি আসআলুকা বিরহমাতিকাল্লাতি ওয়াসিআত কুল্লা শায়ইন আন তাগফিরালি।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 8,),
            Text('অর্থ : হে আল্লাহ! আমি আপনার দয়া ও অনুগ্রহ প্রার্থনা করছি, যা সব কিছুর ওপর পরিব্যাপ্ত, যেন আপনি আমাকে ক্ষমা করেন (ইবনে মাজাহ, হাদিস : ১৭৫৩)', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 15,),
            Text('ইফতার গ্রহণের সময়',style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w600),),
            SizedBox(height: 6),
            Center(
              child: Text("اللَّهُمَّ لَكَ صُمْتُ وَعَلَى رِزْقِكَ أَفْطَرْتُ", style:  TextStyle(
                  color: AppColor.appColor,
                  fontSize:16,
                  fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 8,),
            Text('উচ্চারণ : আল্লাহুম্মা লাকা সুমতু ওয়া আলা রিজকিকা আফতারতু।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 8,),
            Text('অর্থ : হে আল্লাহ! আমি তোমার জন্যই রোজা রেখেছিলাম এবং তোমার রিজিক দ্বারাই ইফতার করলাম। (আবু দাউদ, হাদিস: ২৩৫৮)', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 15,),
            Text('ইফতারের পর',style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w600),),
            SizedBox(height: 6,),
            Center(
              child: Text("ذَهَبَ الظَّمَأُ وَابْتَلَتِ الْعُرُوقُ وَثَبَتَ الْأَجْرُ إِنْ شَاءَ اللَّهُ", style:  TextStyle(
                  color: AppColor.appColor,
                  fontSize:16,
                  fontWeight: FontWeight.w400),),
            ),
            SizedBox(height: 8,),
            Text('উচ্চারণ : জাহাবাজ জমা-উ ওয়াবতাল্লাতিল উরুকু ওয়া ছাবাতাল আজরু ইনশাআল্লাহ।', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
            SizedBox(height: 8,),
            Text('অর্থ: পিপাসা দূর হলো, শিরা-উপশিরা সতেজ হলো আর আল্লাহতাআলার ইচ্ছায় রোজার সওয়াব লিপিবদ্ধ হলো হাদিস শরিফে বর্ণিত আছে, ইফতারের পর নবীজি (সা.) এই দোয়া পড়তেন(আবু দাউদ, হাদিস: ২৩৫৭)', style:  TextStyle(
                color: AppColor.appColor,
                fontSize:16,
                fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    ),
    );
  }
}
