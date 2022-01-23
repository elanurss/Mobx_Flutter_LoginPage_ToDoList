import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_project/app/app_images.dart';
import 'package:mobx_project/screens/login_screen.dart';
import 'package:mobx_project/stores/login_store.dart';
import 'package:mobx_project/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  LoginStore loginStore = LoginStore();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn)
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.cyanAccent[700],
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(AppImages.profilei),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Şifreni mi Unuttun?",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lütfen hesabınızla ilişkili E-postayı girin, size şifrenizi sıfırlama talimatlarını içeren bir bağlantı göndereceğiz.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              hint: 'E-mail',
                              prefix: Icon(Icons.account_circle),
                              textInputType: TextInputType.emailAddress,
                              onChanged: loginStore.setEmail,
                              enabled: !loginStore.loading,
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Observer(
                          builder: (_) {
                            return SizedBox(
                              height: 44.0,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: loginStore.loading
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Text('Gönder'),
                                color: Theme.of(context).primaryColorDark,
                                disabledColor: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100),
                                textColor: Colors.white,
                                onPressed: loginStore.loginEmail,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
