
import 'package:flutter/material.dart';
import 'package:hngx_stage_two/data.dart';
import 'package:hngx_stage_two/editPage.dart';

class HomePage extends StatefulWidget{
  HomePage({Key? key}):super(key: key);

  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
   Data cvData = Data();

   // The method that is called from the next page that updates and replaces the initialization data
   void refreshHomePage({
    String? name,
    String? jobTitle,
    String? slackUsername,
    String? gitHubHandle,
    String? summary,
    List<String>? education,
    List<String>? workExperience,
    List<String>? volunteer }) {

    setState(() {
      
        cvData.name = name!;
        cvData.jobTitle = jobTitle!;
        cvData.slackUsername = slackUsername!;
        cvData.gitHubHandle = gitHubHandle!;
        cvData.summary = summary!;

        cvData.education.clear();
        cvData.education.addAll(education!);

        cvData.workExperience.clear();
        cvData.workExperience.addAll(workExperience!);
        
        cvData.volunteer.clear();
        cvData.volunteer.addAll(volunteer!);

    });

  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0XFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Color(0XFF1E1E1E),
        title: Text("CV Details",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  cvData.name, 
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)
                  ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Text(cvData.jobTitle,
                 style: TextStyle(
                  fontSize: 25,
                  color: Colors.white)),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Text("Slack Username: ${cvData.slackUsername}", 
                style: TextStyle(
                  fontSize: 18,color: Colors.white)),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Text("Git Hub Username : ${cvData.gitHubHandle}", 
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white)),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Text(cvData.summary, style: TextStyle(color: Colors.white)),
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Education", style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    ),
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5)))
                  ],
                ),
              ),

              // Education details
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cvData.education.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              
                              SizedBox(height: 5,),

                              Padding(
                                padding: (index == cvData.education.length - 1)? EdgeInsets.only(left:3,right: 3):EdgeInsets.only(),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(height: 5,),
                              (index == cvData.education.length - 1 ||
                                cvData.education.length== 1)? SizedBox()
                                :Expanded(child: VerticalDivider(color: Colors.white.withOpacity(0.5),))
                    
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(cvData.education[index], style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  );
                }
              ),


              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Work Experience", style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    ),
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5)))
                  ],
                ),
              ),

              // Work experience details
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cvData.workExperience.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              
                              SizedBox(height: 5,),

                              Padding(
                                padding: (index == cvData.workExperience.length - 1)? EdgeInsets.only(left:3,right: 3):EdgeInsets.only(),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(height: 5,),
                              (index == cvData.workExperience.length - 1 ||
                                cvData.workExperience.length== 1)? SizedBox()
                                :Expanded(child: VerticalDivider(color: Colors.white.withOpacity(0.5),))
                    
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(cvData.workExperience[index], style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  );
                }
              ),



              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 5 ),
                child: Row(
                  children: [
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Volunteer", style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    ),
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.5)))
                  ],
                ),
              ),

              // Volunteer details
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cvData.volunteer.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            
                              SizedBox(height: 5,),

                              Padding(
                                padding: (index == cvData.volunteer.length - 1)? EdgeInsets.only(left:3,right: 3):EdgeInsets.only(),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(height: 5,),
                              (index == cvData.volunteer.length - 1 ||
                                cvData.volunteer.length== 1)? SizedBox()
                                :Expanded(child: VerticalDivider(color: Colors.white.withOpacity(0.5),))
                    
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            child: Text(cvData.volunteer[index], style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
                  );
                }
              ),

              SizedBox(height: 20,),

              InkWell(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=> EditCvPage(updateHomescreen: refreshHomePage)));
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Edit CV",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                        SizedBox(width: 10,), 
                        Icon(Icons.arrow_forward, color: Colors.black,)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50,)
            ],
          ),
        ),
      ) 
      );
  }
}