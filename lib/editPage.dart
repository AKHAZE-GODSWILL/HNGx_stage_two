import 'package:flutter/material.dart';

class EditCvPage extends StatefulWidget{
  EditCvPage({Key? key, required this.updateHomescreen}):super(key: key);
  final Function updateHomescreen;
  State<EditCvPage> createState() => _EditCvPage();
}

class _EditCvPage extends State<EditCvPage>{

   // makes sure all fields are entered 
   bool missingFields = false;
   bool isLoading= false;

   // Every controller needed for the various text form fields
   TextEditingController fullnameController = TextEditingController();
   TextEditingController jobDescriptionController = TextEditingController();
   TextEditingController slackController = TextEditingController();
   TextEditingController gitHubController = TextEditingController();
   TextEditingController summaryController = TextEditingController();
   TextEditingController educationController = TextEditingController();
   TextEditingController workExperienceController = TextEditingController();
   TextEditingController volunteerController = TextEditingController();
   


   @override
  void dispose() {
    // TODO: implement 
    
    // Dispose all controllers used
    fullnameController.dispose();
    jobDescriptionController.dispose();
    slackController.dispose();
    gitHubController.dispose();
    summaryController.dispose();
    educationController.dispose();
    workExperienceController.dispose();
    volunteerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0XFF1E1E1E),
      appBar: AppBar(
        
        backgroundColor: Color(0XFF1E1E1E),
        title: Text("Edit CV",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.5,
      ),
      body: Container(
        
        color: Color(0XFF1E1E1E),
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [     
      
              smallCustomContainer(
                context: context,
                title: "Fullname",
                controller: fullnameController
              ),
      
              smallCustomContainer(
                context: context,
                title: "Job Description",
                controller: jobDescriptionController
              ),

              smallCustomContainer(
                context: context,
                title: "Slack Username",
                controller: slackController
              ),

              smallCustomContainer(
                context: context,
                title: "Git Hub Handle",
                controller: gitHubController
              ),

              largeCustomContainer(
                context: context,
                title: "Brief Personal Bio",
                controller: summaryController
              ),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text("NB: Separate all new fields here with the '#' Symbol",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ),
              ),

              largeCustomContainer(
                context: context,
                title: "Education Details",
                controller: educationController
              ),

              largeCustomContainer(
                context: context,
                title: "Work Experience",
                controller: workExperienceController
              ),

              largeCustomContainer(
                context: context,
                title: "Volunteer experience",
                controller: volunteerController
              ),



              SizedBox(height: 60,),

              missingFields? Text("Please fill in all the details",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red
                ),
              ): SizedBox(),

              SizedBox(height: 20,),
      
              InkWell(
                onTap: () {

                  // checks to make sure that every field was entered/ filled
                  if(
                    fullnameController.text.isNotEmpty
                    && jobDescriptionController.text.isNotEmpty
                    && slackController.text.isNotEmpty
                    && gitHubController.text.isNotEmpty
                    && summaryController.text.isNotEmpty
                    && educationController.text.isNotEmpty
                    && workExperienceController.text.isNotEmpty
                    && volunteerController.text.isNotEmpty){
                    setState(() {
                    isLoading = true;

                    //Split the text anywhere that # symbol is found and put in the list
                    List<String> educationList =  educationController.text.trim().split('#');
                    List<String> workExperienceList = workExperienceController.text.trim().split('#');
                    List<String> volunteerList= volunteerController.text.trim().split('#');

                    // Called the update home screen and the data are passed into it for the update in the previous screen
                    widget.updateHomescreen(
                      name: fullnameController.text.trim(),
                      jobTitle: jobDescriptionController.text.trim(),
                      slackUsername: slackController.text.trim(),
                      gitHubHandle: gitHubController.text.trim(),
                      summary: summaryController.text.trim(),
                      education: educationList,
                      workExperience: workExperienceList,
                      volunteer: volunteerList
                    );

                    Navigator.pop(context);
                  });
                  }

                  // If there is any missing field, the missingField variable is set to true
                  // This releases a prompt close to the button to notify you that atleast one of the input was not filled
                  else{
                    setState(() {
                      missingFields = true;
                    });
                  }

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
                          "Done",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                        isLoading?SizedBox(
                        height: 20,
                        width: 20 ,
                        child: CircularProgressIndicator(color: Colors.black)): SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }

  // This custom container is designed for data that do not need so much info
  Widget smallCustomContainer({required BuildContext context,required String title,required TextEditingController controller}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),

          // holds the title of each detail
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 40,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              color: Color(0XFFF3F4F6),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: TextFormField(
                            onChanged: (value){
                          setState(() {
                            
                          });
                        },  
                            keyboardType: TextInputType.text,
                            controller: controller,
                            decoration: InputDecoration(
                              focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                              hintText: "Enter text",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
            ),
          )
        ],
      ),
    );
  }

  // This widget was designed for containers that holds a lot of info
  Widget largeCustomContainer({required BuildContext context,required String title,required TextEditingController controller}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),

          // holds the title of each detail
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 100,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              color: Color(0XFFF3F4F6),
              borderRadius: BorderRadius.circular(8)
            ),
            child: TextFormField(
                          onChanged: (value){
                        setState(() {
                          
                        });
                      },  
                          keyboardType: TextInputType.multiline,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          expands: true,
                          minLines: null,
                          controller: controller,
                          decoration: InputDecoration(
                            focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                            hintText: (title == "Brief Personal Bio")? "Write a Short Bio":"First set of texts.... #Another set of texts",
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
          )
        ],
      ),
    );
  }
}