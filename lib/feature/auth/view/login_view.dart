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
        modelView.networkConnectivity.streamNetworkConnectivity((connectivityResultEnum) {
          modelView.connectivityEnums = connectivityResultEnum;
        });
      }),
      onPageBuilder: ((BuildContext context, AuthModelView modelView) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Observer(builder: (_) {
                return modelView.isLoading ? const SizedBox.shrink() : const Text('Login');
              })),
          body: Observer(
            builder: (_) => modelView.connectivityEnums == NetworkConnectivityEnums.offline
                ? const NoConnectionView()
                : modelView.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: modelView.usernameController,
                                validator: modelView.validateFields,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    label: Text('username'),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0),
                                child: TextFormField(
                                  controller: modelView.passwordController,
                                  validator: modelView.validateFields,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      label: Text('password'),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(onPressed: modelView.signInUser, child: const Text('SignIn')),
                                    const Text('OR', style: TextStyle(color: Colors.white38)),
                                    TextButton(
                                        onPressed: () =>
                                            modelView.navigationService.router.go(NavigationEnums.register.routeName),
                                        child: const Text('Register Page'))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
        );
      }),
    );
  }
}