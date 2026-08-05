import 'package:flutter/material.dart';

// Widget TextFormFieldDay16 adalah halaman form validasi yang mendemonstrasikan
// penggunaan TextField, TextFormField, TextEditingController, FormState, dan validasi input.
class Flutter10 extends StatefulWidget {
  const Flutter10({super.key});

  @override
  State<Flutter10> createState() => _Flutter10State();
}

class _Flutter10State extends State<Flutter10> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextField(
              controller: emailController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextField(controller: emailController),
            TextField(controller: emailController),

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email tidak boleh kosong";
                } else if (!value.contains('@')) {
                  return "Email tidak valid";
                } else if (!value.contains('harus mengandung karakter @')) {
                  return " Wajib diisi dan harus mengandung karakter @";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Password kurang dari 8 karakter";
                }
                return null;
              },
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Konfirmasi Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Konfirmasi Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Konfirmasi Password kurang dari 8 karakter";
                } else if (value != passwordController.text) {
                  return "Password tidak cocok";
                }
                return null;
              },
            ),

            Text(
              emailController.text,
              style: const TextStyle(color: Colors.red, fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
                print(confirmPasswordController.text);

                if (_formKey.currentState!.validate()) {
                  context.push(
                    HomeTugas(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                } else {
                  print("Belum tervalidasi");
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.grey[100],
                      title: const Text("Info"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Lottie.asset("assets/animation/error.json"),
                          Text("${emailController.text} tidak valid"),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text("Baiklah"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text("Tekan ini"),
            ),
          ],
        ),
      ),
    );
  }
}
