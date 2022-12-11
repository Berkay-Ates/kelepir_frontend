import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base_view/base_view_model.dart';
import '../../../core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../no_connection/no_connection.dart';
import '../view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthModelView>(
      viewModel: AuthModelView(),
      onModelReady: ((modelView) {
        modelView.setContext(context);
        modelView.init();
        modelView.networkConnectivity
            .streamNetworkConnectivity((connectivityResultEnum) {
          modelView.connectivityEnums = connectivityResultEnum;
        });
      }),
      onPageBuilder: ((BuildContext context, AuthModelView modelView) {
        return Scaffold(
          body: Observer(
            builder: (_) => modelView.connectivityEnums ==
                    NetworkConnectivityEnums.offline
                ? const NoConnectionView()
                : modelView.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Form(
                          key: key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 100, bottom: 50),
                                  child: Image.asset(
                                    'assets/icons/kelepir_logo.png',
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          'Kullanıcı adı',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            modelView.usernameController,
                                        validator: modelView.validateFields,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[300],
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Şifre',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: modelView.passwordController,
                                      validator: modelView.validateFields,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[300],
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ))),
                                            onPressed: modelView.signInUser,
                                            child: const SizedBox(
                                                width: 100,
                                                height: 50,
                                                child: Center(
                                                    child: Text('Giriş Yap',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ))))),
                                      ),
                                      TextButton(
                                          onPressed: () => modelView
                                              .navigationService.router
                                              .go(NavigationEnums
                                                  .register.routeName),
                                          child: const Text(
                                            'Kayıt Ol',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
        );
      }),
    );
  }
}
