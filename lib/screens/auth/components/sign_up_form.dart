import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  late String _userName, _email, _password, _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: 'Username'),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Yahya Samer'),
            validator: RequiredValidator(errorText: 'Username is required'),
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: 'Email'),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'test@email.com'),
            validator: RequiredValidator(errorText: 'Use a valid email!'),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: 'Phone'),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: '+012345678910'),
            validator: RequiredValidator(errorText: 'Phone number is required'),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: 'Password'),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: '********'),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: 'Confirm Password'),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: '********'),
            validator: (pass) =>
                MatchValidator(errorText: 'Password do not match')
                    .validateMatch(pass!, _password),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }
}
