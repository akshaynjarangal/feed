import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/core/utils/app_colors.dart';
import 'package:feed/presentation/provider/login_provider.dart';
import 'package:feed/presentation/widgets/app_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../widgets/input_decoration_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Enter Your\nMobile Number",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    setHeight(8),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Porta at id hac vitae. Et tortor at vehicula euismod mi viverra.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    setHeight(16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            onTap: null,
                            decoration: inputDecoration(
                              context,
                              hintText: '',
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+91",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.foreground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        setWidth(8),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller:
                                context.watch<LoginProvider>().phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              if (value.length < 10) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: inputDecoration(
                              context,
                              hintText: 'Enter Mobile Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Consumer<LoginProvider>(
              builder: (context, snapshot, _) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  if (snapshot.errorMessage.isNotEmpty) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(snapshot.errorMessage),
                        ),
                      );
                    snapshot.setErrorMessage = "";
                  }
                  if (snapshot.isLoginSuccess) {
                    navkey.currentState?.pushNamedAndRemoveUntil(
                      '/home',
                      (route) => false,
                    );
                  }
                });
                return SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.foreground,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                          ),
                          onPressed: snapshot.isLoading
                              ? null
                              : () async {
                                  if (formKey.currentState!.validate()) {
                                    snapshot.login();
                                  }
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Continue"),
                              setWidth(8),
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.foreground,
                                child: snapshot.isLoading
                                    ? const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.foreground,
                                      )
                                    : const Icon(CupertinoIcons.chevron_right),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
