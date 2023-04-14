import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:valorant_agents/models/agents_model.dart';
import 'package:valorant_agents/network/api_valorant.dart';
import 'package:valorant_agents/screens/agents_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late List<Agent> _agents;

  @override
  void initState() {
    super.initState();
    _getAgents().then((agents) {
      _agents = agents;
      _mockCheckForSession().then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AgentsScreen(agents: _agents),
          ),
        );
      });
    });
  }

  Future<List<Agent>> _getAgents() async {
    final agents = await ValorantAPI.getAgents();
    return agents;
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/valorant_bg.jpg'),
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitFoldingCube(
                color: Color.fromARGB(255, 240, 100, 100),
                size: 50.0,
              ),
              SizedBox(height: 300),
              Text(
                "Cargando...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
