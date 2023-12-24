import 'package:flutter/material.dart';
import 'package:get_random_user1/data/models/userModel.dart';
import 'package:get_random_user1/data/repositoryes/get_user_repo.dart';
import 'package:get_random_user1/presentation/widgets/customTextField.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff68B1C9),
      body: FutureBuilder(
        future: GetUser.getRandomUserName(),
        builder: (context, snapshot) {
          UserModel model = snapshot.data ?? UserModel();
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          GetUser.getRandomUserName();
                          setState(() {});
                        },
                        child: const Text(
                          'Generate',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0042EB)),
                        ),
                      ),
                      CircleAvatar(
                        radius: 74,
                        backgroundImage: NetworkImage(
                            model.results?.first.picture?.large ?? ''),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        hintText:
                            model.results?.first.name?.first.toString() ?? '',
                        labelText:
                            model.results?.first.name?.first.toString() ?? '',
                        keyboardType: TextInputType.name,
                      ),
                      CustomTextField(
                          hintText: model.results?.first.login?.username ?? '',
                          labelText: model.results?.first.login?.username ?? '',
                          keyboardType: TextInputType.text),
                      CustomTextField(
                          hintText: model.results?.first.phone ?? '',
                          labelText: model.results?.first.phone ?? '',
                          keyboardType: TextInputType.phone),
                      CustomTextField(
                          hintText: model.results?.first.email ?? '',
                          labelText: model.results?.first.email ?? '',
                          keyboardType: TextInputType.emailAddress),
                      Spacer(),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff263775),
                            ),
                            onPressed: () {
                              Uri _url = Uri.parse(
                                  'https://www.google.com/maps/search/?api=1&query=${model.results?.first.location?.coordinates?.latitude},${model.results?.first.location?.coordinates?.longitude}');
                              _launchUrl(_url);
                            },
                            child: const Text(
                              'Get location',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
