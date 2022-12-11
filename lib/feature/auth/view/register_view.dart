import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kelepir/core/enums/navigations_enum/navigation_enums.dart';
import '../../../core/base_view/base_view_model.dart';
import '../../../core/enums/networkEnum/network_enum.dart';
import '../../no_connection/no_connection.dart';
import '../view_model/auth_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Observer(builder: (_) {
                return modelView.isLoading
                    ? const SizedBox.shrink()
                    : const Text('Register');
              })),
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
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          'İsim',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: modelView.nameController,
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
                                          'Soy İsim',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: modelView.surnameController,
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
                                          'Email',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: modelView.emailController,
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
                                          'Şifre',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            modelView.passwordController,
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
                                            onPressed: modelView.registerUser,
                                            child: const SizedBox(
                                                width: 100,
                                                height: 50,
                                                child: Center(
                                                    child: Text('Kayıt Ol',
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
                                                  .login.routeName),
                                          child: const Text(
                                            'Giriş Yap',
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
/*
onPressed: () => modelView
                                              .navigationService.router
                                              .go(NavigationEnums
                                                  .login.routeName),*/
//modelView.registerUser