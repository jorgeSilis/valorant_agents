import 'package:flutter/material.dart';
import 'package:valorant_agents/models/agents_model.dart';
import 'package:valorant_agents/screens/agents_details.dart';

class AgentsScreen extends StatelessWidget {
  final List<Agent> agents;

  const AgentsScreen({Key? key, required this.agents}) : super(key: key);

 Widget buildAgentCard(BuildContext context, Agent agent) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AgentDetailsScreen(agent: agent)),
        );
    },
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              agent.bustPortrait,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                agent.displayName,
                style: TextStyle(
                  
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                agent.developerName,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Agents'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: agents.map((agent) => buildAgentCard(context, agent)).toList(),
      ),
    );
  }
}
