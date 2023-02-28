import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  List<dynamic> _plans = [];

  @override
  void initState() {
    super.initState();
    loadPlans();
  }

  Future<void> loadPlans() async {
    String plansJson = await rootBundle.loadString('assets/plans.json');
    setState(() {
      _plans = json.decode(plansJson)['plans'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Workout Plans'),
      ),
      body: _plans.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _plans.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> plan = _plans[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlanDetailsPage(plan: plan),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(plan['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          title: Text(plan['title']),
                          subtitle: Text(plan['description']),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PlanDetailsPage extends StatelessWidget {
  final Map<String, dynamic> plan;

  const PlanDetailsPage({Key? key, required this.plan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> exercises = plan['exercises'];

    return Scaffold(
      appBar: AppBar(
        title: Text(plan['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(plan['image']),
                fit: BoxFit.cover,
              ),
            ),
            height: 300,
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> exercise = exercises[index];
                return Card(
                  child: ListTile(
                    title: Text(exercise['title']),
                    subtitle: Text(exercise['description']),
                    trailing: Text(
                        'Sets: ${exercise['sets']}, Reps: ${exercise['reps']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
