import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stress_management_app/utils/constants.dart';
import 'package:stress_management_app/utils/navigation.dart';
import 'package:stress_management_app/widgets/button.dart';

class StressedScreen extends StatefulWidget {
  const StressedScreen({super.key});

  @override
  _StressedScreenState createState() => _StressedScreenState();
}

class _StressedScreenState extends State<StressedScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<bool> _selectedCauses = [false, false, false, false, false];

  void handleSubmit() async {
    if(_selectedCauses[0] != false || _selectedCauses[1] != false || _selectedCauses[2] != false || _selectedCauses[3] != false || _selectedCauses[4] != false){
      moveToRecommendations(_selectedCauses);
    } else {
      kDefaultDialog2(
        "No option selected",
        "Please choose one or more of the suggested causes of stress",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stressed', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'It looks like you are stressed, could these have caused the stress.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 32,),
                const Row(
                  children: [
                    Text(
                      'Tick where applicable:',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),

                Column(
              children: [
                CheckboxListTile(
                  title: const Text('Too much workload', style: TextStyle(color: Colors.white),),
                  value: _selectedCauses[0],
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _selectedCauses[0] = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Role ambiguity', style: TextStyle(color: Colors.white),),
                  value: _selectedCauses[1],
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _selectedCauses[1] = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Poor work life balance', style: TextStyle(color: Colors.white),),
                  value: _selectedCauses[2],
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _selectedCauses[2] = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Lack of Resources', style: TextStyle(color: Colors.white),),
                  value: _selectedCauses[3],
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _selectedCauses[3] = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Job Insecurity', style: TextStyle(color: Colors.white),),
                  value: _selectedCauses[4],
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _selectedCauses[4] = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16,),
              ],
            ),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(onTap: (){
                  kDefaultDialog(
                      "Are you sure?",
                      "All your current progress will be lost.",
                      onYesPressed: moveToHome,
                    );
                }, text: "Cancel"),
                const SizedBox(width: 4,),
                SmallButton(onTap: handleSubmit, text: "Submit"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
