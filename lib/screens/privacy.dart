import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:survey/common/btn_widget.dart';
import 'package:survey/generated/l10n.dart';
import 'package:survey/models/registrastion_data.dart';
import 'package:survey/screens/dashboard.dart';
import 'package:survey/screens/sign_up_password.dart';
import 'package:survey/utils/colors..dart';
import 'package:survey/utils/util.dart';
import '../common/text_widget.dart';

import 'package:html/dom.dart' as dom;

class PrivacyScreen extends StatelessWidget {
  final RegistrationData registrationData;

  const PrivacyScreen({Key key, this.registrationData}) : super(key: key);

//   var  htmlData =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 100,
        decoration: BoxDecoration(
            image: DecorationImage(image: c.backAsset, fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              c.marginTop35,
              Container(
                child: c.logoWhite,
              ),
              c.marginTop15,
              text(S.of(context).term_condition, 20, Color(0xffffffff),
                  "assets/fonts/Janna LT Regular.ttf", context, true),
              widgetText(context),
              Container(
                  margin: EdgeInsets.only(left: 12, right: 12),
                  child: buttonWidget(onclick, S.of(context).agree,
                      MediaQuery.of(context).size.height * 8 / 100))
            ],
          ),
        ),
      ),
    );
  }

  onclick() {
    Get.to(PasswordScreen(registrationData: registrationData));
  }

  widgetText(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(7),
      width: MediaQuery.of(context).size.width * 100,
      height: MediaQuery.of(context).size.height * 45 / 100,
      decoration: BoxDecoration(
          color: white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child:
        Html(
          data:
          '''
    <!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<link rel="stylesheet" href="">
<style>
</style>
<body>
							<h1>Terms and Conditions</h1>
							<p>
								<p>To become a Member of Marketeers Panel, you need to be a resident of Egypt and be 15 years old or over. Marketeers is a leading market research company focused on online research and data collection. We offer our members (hereafter called Panelists) the chance to participate today in the testing and evaluation of tomorrow's services and products and express their opinions on a wide range of issues. Your voice represents the voice of thousands!
Marketers Consulting and Marketing Research - LLC. It is a company registered in the Joint Stock Companies Center with Commercial Registry No. 158494 and located in El Serag Mall, Nasr City, Cairo, Egypt.
By completing this membership registration, you agree to be bound by our membership terms and conditions. Please read these terms and conditions below.</p>
<h2>1. Contents	</h2>
<ul style="list-style-type:none;">
<li>1.	Contents</li>
<li>2.	Rules for subscribers to marketers point surveys</li>
<li>3.	Joining the Panel</li>
<li>4.	Use of your personal information</li>
<li>5.	Email policy</li>
<li>6.	Registration of background information</li>
<li>7.	Registration in the Panel using Facebook</li>
<li>8.	How does the Panel work?</li>
<li>9.	Acceptable use and participation</li>
<li>10.	Children's privacy</li>
<li>11.	Rewarding you for answering online surveys</li>
<li>12.	Use of your information</li>
<li>13.	Cookies, Digital Fingerprinting, Device Data, and Other Information on Your Device</li>
<li>14.	Confidentiality notice</li>
<li>15.	Intellectual property</li>
<li>16.	Indemnity and limitation of liability</li>
<li>17.	Participation conditions</li>
<li>18.	Termination/Inactivation of Membership</li>
<li>19.	Jurisdiction</li>
<li>20.	Contact us</li>
<li>21.	Languages</li>
</ul>
<h2>2. Rules for subscribers to marketers point surveys</h2>
Marketeers Research uses this panel of respondents who participate in online surveys. Marketers Panel sends the links to these surveys to its members (???members???, ???committee members???) via e-mail, short message (SMS), or any other electronic means of communication.

<h2>3. Joining the Panel</h2>
Subject to the age requirements mentioned above, everybody is free to apply for membership in the Panel. Nevertheless, we reserve the right to deny membership, without any requirement to justify such a denial.
Membership is not open to Marketeers employees, its subsidiaries, affiliates and suppliers or their immediate family.
<h2>4. Use of your personal information</h2>
The information collected about you will be treated in the strictest confidence and in accordance with all applicable laws, regulations and rules including those relating to privacy and personal data and our privacy and cookie policies. These policies are an integral part of these Terms and Conditions and can be here(Privacy Policy link) As part of this undertaking, we promise that:
<ul> <!--style="list-style-type:none;"-->
<li> Other than in relation to this Panel, we will not try to sell you anything or pass your personal information to any third parties for marketing or sales purposes.</li>
<li> Your individual responses to surveys will remain confidential, as they will only be used grouped with other confidential responses, unless you explicitly consent otherwise.</li>
<li> Refusal to answer a particular question will have no consequences with regard to your membership.</li>
<li> You can ask to be removed from the Panel and end your membership at any time.</li>
</ul>
<h2>5. Email policy</h2>
As you have voluntarily registered in the Panel, and confirmed your email address, phone number and area of residence upon registration, you should not mark emails or other communication received from us as spam or unsolicited communication, and you might be responsible for any resulting damage to Marketeers.
Depending on your mailbox security settings, the survey invitations you receive from us might be directed to your bulk / junk mail or similar folder. 

<h2>6. Registration of background information</h2>
With respect to the statistical analyses that Marketeers delivers to its clients, Marketeers needs certain demographic and personal information about you, including confidential information, for instance, your income.
Providing Marketeers with this personal information is a condition for participation in the Panel as it would otherwise not be possible for us to determine whether your participation in any survey would meet such surveys criteria. You hereby consent to Marketeers registering your data in the Panel database. We may also ask some basic details about any other members in your house hold, including children in respect of which you are the parent/legal guardian.
During the registration process and during your participation in our research surveys, you agree to provide only true, accurate and complete information and agree to update the Panel account related information that you supplied to ensure it remains up to date and accurate.
<h2>7. Registration in the Panel using Facebook</h2>
You can also become a member of the Panel in a simplified and enhanced manner by signing-in to your Facebook account using the "Marketeers Panel sign up" Facebook application (the "Application") run on the Marketeers Panel website registration page through the "Join using Facebook" button .The use of this Application will be subject to the Facebook terms and conditions relating to it which you may find here: https://www.facebook.com/terms.php
After you click on the login button, you will be presented with an authorization dialog in your browser that provides information about the Marketeers Panel website and the Facebook user data the Marketeers Panel website is requesting permission to access and use.
You will be asked for your permission to register in the Application. If you grant permission, you will be explicitly consenting to Marketeers Panel accessing, storing and using your basic profile information held in your Facebook account, such as your name, email address, gender, birthday, location, and phone number ("Your Facebook profile information"), for as long as you are a member of the Panel.
Based on your consent, your Facebook profile information will be transferred and prefilled in the Panel registration form. From time to time, Marketeers may also use your Facebook profile information to update the information held in your Panel membership record, to ensure that it remains accurate and up to date.
If you do not agree to Marketeers accessing this information, then no information will be available to the Marketeers Panel website or registered in the Panel. Also, if you decide to remove the Application from your Facebook account, Marketeers will no longer have access to your Facebook profile information. You can remain a member of the Panel even if you remove the Application from your Facebook account.
Your last Facebook profile information will be stored and used by Marketeers for as long as you will remain a member of the Panel.
You can review the information that is pre-filled in the Panel registration form through the Application, and then continue the registration process in the Panel by filling in the rest of information within the registration form.
For further information about how we may use your personal information, please see our Privacy Policy.
<h2>8. How does the Panel work?</h2>
Panelists will receive survey invitations by email SMS or other electronic communication from Marketeers with links leading to surveys. There is no obligation for you to answer surveys. Each survey is only to be answered once. If you decide you are not interested to take part in a specific survey, you can always click on the survey???s "no reminders" link at the bottom of the invitation email. This means that you will not receive reminders for that specific survey, but you will still receive other survey invitations. Please do not mark emails from Marketeers Panel as spam, as explained in the previous section. Marketeers is not bound to send surveys to all Panelists for each new survey; nor can Marketeers guarantee either a minimal or a maximal number of surveys that are sent out per year.
Marketeers has taken high data safety measures. Still, should any viruses appear in the emails sent to you, Marketeers is not liable for the consequences that such cases may entail and thus no compensation may be claimed from Marketeers for such reasons.
Our Panelists cannot participate in surveys outside of their countries of registration. If you move to another country, you will need to cancel your membership and register again in the new country. We will transfer your points to the new account.
<h2>9. Acceptable use and participation</h2>
Marketeers is dedicated to creating an environment where members can participate safely and respectfully, keeping in mind the views and opinions of other Marketeers Panel members. While participating in the Panel, you understand that any messages, opinions, information, pictures or any other materials posted by members are the sole responsibility of the person who posted the material.
You agree that you will not post or upload any material that:
<ul style="list-style-type:none;">
<li>??? Is illegal. This includes content or any messages that promote or discuss illegal activities or encourages others to commit them.</li>
<li>??? Is abusive, obscene or hateful. This includes language, information or images. Masked swearing (e.g. "f__k") is considered the equivalent of the actual swear word.</li>
<li>??? Is threatening, harassing, libelous or defamatory either between Panel members or directed towards an Marketeers moderator or other employee.</li>
<li>??? Is bigoted - racially, ethnically, sexually or otherwise offensive - toward anyone.</li>
<li>??? Is an inappropriate political or religious message.</li>
<li>??? Is aimed at advertising or marketing any goods or services.</li>
<li>??? Contains viruses, corrupted files, "Trojan Horses" or any other malicious code.</li>
<li>??? Contains your personal contact details or the personal details of other people.</li>
<li>??? Is owned by or under the copyright of someone else.</li>
<li>??? Includes a link to a website or any URL characters</li>


</ul>
Please note that Marketeers will screen all information posted by members,.
When you use the Marketeers Panel to upload, publish, create or submit any other content to or through the Marketeers Panel's site or surveys, you accept that you are granting Marketeers full rights to use and distribute the results of that poll or content. In legal terms, this mean you grant Marketeers a full worldwide, royalty-free, transferable and irrevocable license to use, copy, reproduce, modify, distribute, prepare derivative works of, display, perform and exploit such content for any commercial purposes whatsoever and in any manner seen fit. It is however clearly understood that, in accordance with its professional rules and its contractual obligations to Panelists, Marketeers is under a duty to preserve the anonymity of the Panelists when providing market, opinion and social research and data analytics services. Accordingly, Marketeers hereby undertakes to respect this anonymity.
<h2>10. Children's privacy</h2>
If you provided information concerning children in your household and confirmed that you are the parent or legal guardian, we might contact you in respect of surveys which we would like them to complete. We will always require your prior consent and will not contact such child directly, unless they are already a member of the Panel in their own right.
<h2>11. Rewarding you for answering online surveys</h2>
Each time you complete a survey, before the deadline, you may receive a reward upon completion and/or may be entered a prize draw, provided that you have given quality responses. The type and size of the reward or of the prize draw may vary according to the survey difficulty, length, or other similar elements.
Marketeers reserves the right, at any time, to implement a verification period (of maximum 96 hours), during which your reward will be held in "Pending" status. During this period, we will undertake quality control and fraud prevention checks. We will inform you of any such waiting period applicable to you, via the FAQ section of the Panel members' website or by other means of communication. Newly registered Marketeers Panel members may also need to wait 96 hours from their registration date before any reward will be released from "Pending" status.
When the necessary number of Panelists has answered a survey, or you do not actually fit the profile Marketeers or its clients have the right to end the survey at any stage and not collect further answers. In such a situation and depending on the stage reached in any survey, a reduced number or no points may be awarded.
There may be instances where the reward of recently completed surveys does not immediately appear in your account. In such cases the reward, if a reward was indicated, will be added later to your account.
<h2>12. Use of your information</h2>
We explained how your personal information is used in more detail in our privacy policy - specifically in the "Privacy Policy" section.
<h2>13. Cookies, Digital Fingerprinting, Device Data, and Other Information on Your Device.</h2>
We aim to:
<ul style="list-style-type:none;">
<li>??? Ensure that the survey is delivered are in a form suited to your device.</li>
<li>??? Assist in providing support to you should you have difficulty accessing or completing a survey.</li>
<li>??? Use anonymized information whenever possible for research purposes. For example, to determine the percentage of Panelists that use a certain type of browser in a specific country.</li>
The reasons we are using the below measures are described in more detail in our Privacy policy .
</ul>
Cookies
As set out in more detail with in our "Cookies" policy, we are using different kinds of cookies and might also read cookies set by third parties. Other than with your prior consent, cookies are used for statistical purposes, quality control, validation, fraud prevention and fraud control, and, more importantly, to prevent us sending you reminders for any on-line survey you have already completed.
Digital Fingerprinting
We may also use certain information about the hardware and software present on your device for quality control and fraud prevention purposes.
We also automatically capture information about your IP address, operating system, screen display settings, browser type, location data, advertising IDs, use of Flash and Java and whether your device has a webcam.
<h2>14. Confidentiality notice</h2>
As a research participant, you may be asked to review new concepts, products and packaging that are still in the early stages of development, and as such not known to the public. You may come in contact with, be allowed to see or use or otherwise have access to certain non-public, confidential, proprietary, or trade secret information or material that are the sole and exclusive property of our relevant client, including, without limitation, information with respect to the client products (collectively, "Confidential Information"). You must not copy, print, store, forward or disclose to anyone by any means, the Confidential Information you will have access to, and must not use the Confidential Information for other purpose than the purpose for which it was disclosed to you.
<h2>15. Intellectual Property</h2>
Marketeers shall own and retain exclusive ownership of its trademarks, logos, copyrights, any content of its website and other intellectual property rights ("Marketeers IP"). You may not use or reproduce any of the Marketeers IP without Marketeers' prior written consent. Nothing in these Terms and Conditions shall be construed as granting you any license, right, title or interest in any Marketeers IP, or any patent, trademark, copyright, know-how, or similar right now or hereafter owned or controlled by Marketeers.
<h2>16. Indemnity and limitation of liability</h2>
You agree to indemnify, defend and hold harmless Marketeers and each of its respective officers, partners, clients, managers, employees, agents and attorneys, from and against any and all liabilities, claims, actions, suits, proceedings, judgments, fines, damages, costs, losses and expenses (including reasonable legal fees, court costs and/or settlement costs) arising from or related to: (i) your membership within the Panel, (ii) your participation within research surveys conducted by Marketeers, (iii) any third party claims, (iv) any breach by you of these Terms and Conditions. In case of violation of said terms and conditions, you will be excluded from the Panel.
Any unlawful or disparaging action caused by you during your membership within the Panel and to your participation within research surveys conducted by Marketeers, that may be considered a violation of criminal and/or civil law shall entitle Marketeers to seek all remedies in this regard against any unlawful or disparaging action to the fullest extent permitted by law and in equity. Marketeers disclaims any warranties, express and implied, related to your membership within the Panel and to your participation within research surveys conducted by Marketeers and Marketeers shall have no liability whatsoever (including without limitation liability for any indirect, special, incidental or consequential damages), to you or any third party, for your membership within the Panel and to your participation within research surveys conducted by Marketeers.
You agree and warrant that (i) you are not acting, directly or indirectly, for or on behalf of any person, group, entity who commits, threatens to commit any act of terrorism, that (ii) you do not support in any way, directly or indirectly, any person, group, entity who commits, threatens to commit any act of terrorism.
You also agree that you release and forever discharge Marketeers, Marketeers' client, each of their affiliated companies and each of their respective officers, directors, shareholders, employees, and agents from and against all claims, lawsuits, causes of action, demands, losses, liabilities, obligations, judgments, damages, costs and expenses of any kind (including reasonable attorneys' fees) ("Losses") arising directly or indirectly out of any injury, death, property damage or other damage sustained or allegedly sustained by you resulting from the distribution, sale, consumption, use or contact with the product in connection with the product test and evaluation research. This does not apply to any Losses which may be caused by Marketeers' client's or Marketeers' gross negligence or any liability by the them under applicable product liability or consumer protection legislation.
<h2>17. Participation conditions</h2>
Marketeers reserves the right, at any time, to change the present "Terms and Conditions". We will inform you of any updates via the Marketeers Panel website.
From time to time, we may contact you by email or phone for account administration purposes, or for research purposes as well as email newsletters or special announcements containing key information related to your Panel membership activity and key Panel updates ("Membership Updates").
We may also send you email communication about (i) Panel activities, rewards that you may be eligible for through your participation in our surveys, (ii) new Panel engagement campaigns that we have regarding new Panel rewards and/or redemption (collectively named "Engagement Updates"). Receiving any of these Engagement Updates is optional and you can separately opt-out from Engagement Updates at any time by using the unsubscribe link provided in those emails.
In some cases, individual surveys may be subject to additional conditions of which you will be made aware at the beginning of such survey. You will be under no obligation to accept such additional conditions, however, this may affect your eligibility for such survey.
<h2>18. Termination/Inactivation of Membership</h2>
These Terms and Conditions are valid for the present, with a period of notice of ten (10) working days applicable to both parties.
If you request your account to be deleted, you have 30 calendar days to redeem your points. At the end of this period the points account will be automatically deleted. Your account will become inactive in the Marketeers database.
You agree that Marketeers has the right to terminate your membership in the Panel automatically and without the need for a formal notice or any other judicial or extrajudicial proceedings, for any conduct not within our quality parameters or business objectives, or for any violation or breach of these terms and conditions, the privacy policy, or survey rules. Any use of the Panelist account by an individual other than the Panelist is considered an unauthorized use and may be grounds for termination and forfeiture of points.
In the event of termination for these reasons, the Panelist will automatically lose access to their account and their reward points will be forfeit (including those points or other rewards held in "Pending" status, as the case may be).
Marketeers reserves the right to terminate the membership of inactive Panelists. This means deleting the Panelist's account and erasing the respective points account completely, if the Panelist does not respond to any survey for more than 12 months. Marketeers will inform you of such termination and you will have 30 calendar days to redeem any remaining points. 

<h2>19. Jurisdiction</h2>
These Terms and Conditions are governed by Egypt law.
<h2>20. Contact us</h2>
For more information about our panels, Panel membership or information related to your membership of one of our panels, please contact our Panel Support Team. They can be contacted through the "FAQs/Contact us" page on the website.

<h2>21. Languages</h2>
These Terms and Conditions have been drafted in the English language. In the event of any conflict between the English version of this document and any subsequent translation into any other language, the English version shall prevail.

							</p>
						
 <p>

</p>

</body>
</html>
  ''',

          imageProperties: ImageProperties(width: 120,height: 120),
          padding: EdgeInsets.all(8.0),
          defaultTextStyle:TextStyle(fontSize: 18,height: 1.5),
          linkStyle: const TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
            decorationColor: Colors.redAccent,
            decoration: TextDecoration.underline,
          ),
          onLinkTap: (url) {
           // print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          //Must have useRichText set to false for this to work
          customRender: (node, children) {
            if (node is dom.Element) {
              switch (node.localName) {
                case "custom_tag":
                  return Column(children: children);
              }
            }
            return null;
          },
          customTextAlign: (dom.Node node) {
            if (node is dom.Element) {
              switch (node.localName) {
                case "p":
                  return TextAlign. justify;
                case "ul":
                  return TextAlign. justify;

              }
            }
            return null;
          },
          customTextStyle: (dom.Node node, TextStyle baseStyle) {
            if (node is dom.Element) {
              switch (node.localName) {
                case "p":
                  return baseStyle.merge(TextStyle(height: 1.5, fontSize: 18,));
              }
            }
            return baseStyle;
          },

          // all other parameters are optional, a few notable params:

      // specify custom styling for an element
      // see supported inline styling below


      // render a custom widget
   /*   customWidgetBuilder: (element) {
     *//*   if (element.attributes['foo'] == 'bar') {
          return null;
        }*//*

        return null;
      },*/

      // set the default styling for text
     // textStyle: TextStyle(fontSize: 14),

      // turn on `webView` if you need IFRAME support
      //webView: true,
    )
            ));
}
}