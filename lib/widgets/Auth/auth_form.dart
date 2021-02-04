import 'dart:io';

import 'package:chat_app/widgets/Auth/pickers/image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password, String userName,
      File image, bool isLogin, BuildContext ctx) submitFn;
  bool isLoading;
  AuthForm(this.submitFn, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _islogin = true;
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_islogin) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an image'),
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _userImageFile, _islogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  //mainAxisSize makes sure that column takes only as such space as needed by the childrens
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_islogin) UserImagePicker(_pickedImage),
                    TextFormField(
                      key: ValueKey('Email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please provide a valid email address';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email address'),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),
                    if (!_islogin)
                      TextFormField(
                        key: ValueKey('UserName'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 4) {
                            return 'Please provide a valid username';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(labelText: 'UserName'),
                        onSaved: (value) {
                          _userName = value;
                        },
                      ),
                    TextFormField(
                      key: ValueKey('Password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return 'Passwords much be min of 7 chars';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) {
                        _userPassword = value;
                      },
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      RaisedButton(
                        onPressed: _trySubmit,
                        child: Text(_islogin ? 'Login' : 'Sign up'),
                      ),
                    if (!widget.isLoading)
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            _islogin = !_islogin;
                          });
                        },
                        child: Text(_islogin
                            ? 'Create a new Account'
                            : 'I already have an account!'),
                      )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
