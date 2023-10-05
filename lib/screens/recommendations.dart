
import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:stress_management_app/widgets/button.dart';

class RecommendationScreen extends StatefulWidget {
  final List<bool> causes;
  const RecommendationScreen({super.key, required this.causes});

  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  // final List recommendations = ['1. Say no to work outside your roles', '2. Clarify your roles and expectations', '3. Go for travels, shows and  swimming during the weekend', '4. Reduce your brain'];

  final List recommendations = [];

  @override
  void initState() {
    print(widget.causes);
    if(widget.causes[0] && widget.causes[1] && widget.causes[2] && widget.causes[3] && widget.causes[4]) {
      recommendations.add('Prioritize tasks and set realistic goals.');
      recommendations.add('Say no to work outside your roles');
      recommendations.add('Enhance your skills through learning.');
      recommendations.add('Communicate resource needs to your team.');
    }
    else {
      if(widget.causes[0]) {
            recommendations.add('Prioritize tasks and set realistic goals.');
            recommendations.add('Communicate workload concerns with your manager.');
          }
      if(widget.causes[1]) {
            recommendations.add('Say no to work outside your roles');
            recommendations.add('Clarify your roles and expectations');
          }
      if(widget.causes[2]) {
            recommendations.add('Go for travels, shows and  swimming during the weekend');
            recommendations.add('Establish boundaries for work and personal life.');
          }
        if(widget.causes[3]) {
            recommendations.add('Communicate resource needs to your team.');
          }
        if(widget.causes[4]) {
            recommendations.add('Enhance your skills through learning.');
          }
    } 
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendations', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Try these solutions',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 32,),


            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView.builder(
                itemCount: recommendations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${index+1}. ${recommendations[index]}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  );
                },
              ),
            ),
            
            const SizedBox(height: 16,),
            const Row(
              children: [
                Text("Need to talk to someone", style: TextStyle(color: Colors.white, fontSize: 20),),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                  'Email HR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 4,),
                    OutlineButton(onTap: (){
                      moveToEmail();
                    }, text: "Send"),
                  ],
                ),
                const SizedBox(width: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                  'Schedule',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                    const Text(
                  'meeting',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 4,),
                    OutlineButton(onTap: (){
                      moveToTherepist();
                    }, text: "Submit"),
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 32,),
            const CustomButton(onTap: moveToSensation, text: "Sensations")
          ],
        ),
      ),
    );
  }
}
