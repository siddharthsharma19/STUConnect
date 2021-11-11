import 'package:ritstudent/constants.dart';
import 'package:flutter/material.dart';
import 'package:ritstudent/screens/signin/signin.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/logo.png"
                    : "assets/images/logo1.png",
                height: 146,
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Text(
              "Welcome to RITStudent",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 6,
            ),
            FittedBox(
                child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ),
                        ),
                    child: Row(
                      children: [
                        Text(
                          "Skip",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!
                                        .withOpacity(0.8),
                                  ),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8),
                        ),
                      ],
                    ))),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ))),
    );
  }
}
