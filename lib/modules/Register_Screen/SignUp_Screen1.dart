import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:san3a/animation.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/Register_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Register_Screen/Cubit/states.dart';
import 'package:san3a/modules/Register_Screen/Verfiy_SignUp/Choose_send/choose_sendforRegister%20.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';
import '../../header.dart';

class SignUp_Screen extends StatelessWidget {
  final RegisterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            if (state.regesterModel.status) {
              navigateAndFinish(context, choose_send_Register(
                email: RegisterCubit.get(context).emailcontroller.text,
                phone: RegisterCubit.get(context).phone,)
              );
              showToast(
                  text: state.regesterModel.message,
                  state: ToastState.SUCCESS);
            } else {
              print(state.regesterModel.message);
              showToast(
                text: state.regesterModel.message,
                state: ToastState.ERORR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: RegisterKey,
                  child: Column(
                    children: [
                      FadeAnimation(
                        1,
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Container(
                              height: size.height * 0.3 > size.width * 0.3 ? size.height * 0.3 : size.width * 0.3,
                              child: FadeAnimation(
                                  1.2,
                                  HeaderWidget(
                                    size.height * 0.3,
                                    true,
                                    SizedBox()
                                  )), //let's create a common header widget
                            ),
                            Column(
                              children: [
                                FadeAnimation(
                                  1.3,
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      RegisterCubit.get(context).pickedFile == null? CircleAvatar(
                                          radius: 80,
                                          backgroundImage: AssetImage(
                                            'assets/images/img_5.jpeg',
                                          )) : CircleAvatar(
                                        radius: 80,
                                        backgroundImage: FileImage(RegisterCubit.get(context).profileImage!),
                                      ),
                                      //backgroundColor: Colors.white12,
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(
                                          bottom: 7.0,
                                          end: 7.0,
                                        ),
                                        child: InkWell(
                                          child: const Icon(
                                            Icons.add_a_photo,
                                            color: Color(0xff4377ec),
                                          ),
                                          onTap: () {
                                            print('Camera clicked');
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    bottomSheet(context, RegisterCubit.get(context)));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // const SizedBox(
                      //   height: 5.0,
                      // ),
                      FadeAnimation(1.3,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: default_tTextFormField(
                            controller: RegisterCubit.get(context).namecontroller,
                            keyboardType: TextInputType.name,
                            labelText: 'Enter Your Full Name',
                            prefix: Icons.person,
                            validate: (String? nvalue) {
                              if (nvalue!.isEmpty) {
                                return 'name must not be empty';
                              } else if (nvalue.length < 3) {
                                return 'name must mire than three char';
                              } else {
                                return null;
                              }
                            },
                            onFieldSubmitted: (nvalue) {
                              print(nvalue);
                            },
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(1.3,
                         Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: default_tTextFormField(
                            controller: RegisterCubit.get(context).emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Enter Your Email Adress',
                            prefix: Icons.email,
                            validate: (evalue) {
                              if (evalue!.isEmpty) {
                                return "email must not be empty";
                              } /*else if (!EmailValidator.validate(evalue, true)) {
                                return "Invalid Email Address";
                              }*/ else {
                                return null;
                              }
                            },
                            onFieldSubmitted: (nvalue) {
                              print(nvalue);
                            },
                          ),
                        ),
                      ),

                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(1.3,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: TextFormField(
                            controller: RegisterCubit.get(context).passcontroller,
                            onFieldSubmitted: (value) {
                              print(value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: RegisterCubit.get(context).isPassword,
                            decoration: InputDecoration(
                              // hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context)
                                      .ChangePasswordVisibilit();
                                },
                                icon: Icon(RegisterCubit.get(context).suffix),
                              ),
                              labelText: 'Password',
                              // border: const OutlineInputBorder(
                              //     borderRadius:
                              //     BorderRadius.all(Radius.circular(50))),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(
                        1.3,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: TextFormField(
                            controller:
                            RegisterCubit.get(context).comfpasscontroller,
                            onFieldSubmitted: (cvalue) {
                              print(cvalue);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Confirm password must not be empty';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: RegisterCubit.get(context).isPassword,
                            decoration: InputDecoration(
                              // hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context)
                                      .ChangePasswordVisibilit();
                                },
                                icon: Icon(RegisterCubit.get(context).suffix),
                              ),
                              labelText: 'Confirm Password',
                              // border: const OutlineInputBorder(
                              //     borderRadius:
                              //     BorderRadius.all(Radius.circular(50))),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //    height: 10.0,
                      //  ),
                      FadeAnimation(
                        1.6,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: InternationalPhoneNumberInput(
                            textFieldController:
                            RegisterCubit.get(context).phonecontroller,
                            selectorConfig: SelectorConfig(
                              setSelectorButtonAsPrefixIcon: true,
                              selectorType: PhoneInputSelectorType.DIALOG,
                            ),
                            inputDecoration: InputDecoration(
                              labelText: 'Phone Number',
                            ),
                            formatInput: true,
                            onInputChanged: (PhoneNumber phoneNumber) {
                              RegisterCubit.get(context).changePhone(phoneNumber.phoneNumber!);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            onSaved: (phoneNumber) {
                              RegisterCubit.get(context).phonecontroller.text =
                              phoneNumber.phoneNumber!;
                              //RegisterCubit.get(context).countryCodecontroller.text = phoneNumber!.dialCode!;
                            },
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.6,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            children: [
                              //  SizedBox(width: 20.0,),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                  RegisterCubit.get(context).dayController,
                                  decoration: InputDecoration(labelText: 'Day'),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a day';
                                    }
                                    // Add any additional validation rules for the day field here
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                  RegisterCubit.get(context).monthController,
                                  decoration: InputDecoration(labelText: 'Month'),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a month';
                                    }
                                    // Add any additional validation rules for the month field here
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                  RegisterCubit.get(context).yearController,
                                  decoration: InputDecoration(labelText: 'Year'),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a year';
                                    }
                                    // Add any additional validation rules for the year field here
                                    return null;
                                  },
                                ),
                              ),
                              //  SizedBox(width: 20.0,),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(1.3,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: default_tTextFormField(
                            controller: RegisterCubit.get(context).cityController,
                            keyboardType: TextInputType.streetAddress,
                            labelText: 'Enter Your Address',
                            prefix: Icons.streetview,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Address must not be empty';
                              }
                            },
                            onFieldSubmitted: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(1.3,
                         Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: default_tTextFormField(
                            controller: RegisterCubit.get(context).Nidcontroller,
                            keyboardType: TextInputType.number,
                            labelText: 'Enter Your National ID',
                            prefix: Icons.card_membership,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'National Id must not be empty';
                              }
                            },
                            onFieldSubmitted: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.6,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: MaterialButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => bottomSheetForNid(context, RegisterCubit.get(context)));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 8.0),
                                Text('Upload Your NID Photo'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 20.0,
                      // ),
                      FadeAnimation(
                          1.9,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    value: "worker",
                                    groupValue: RegisterCubit.get(context).type,
                                    title: Text(
                                      'Worker',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    tileColor: Colors.deepPurple.shade50,
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    onChanged: (value) {
                                      RegisterCubit.get(context)
                                          .selectValue(value!);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    //content
                                    value: "customer",
                                    groupValue: RegisterCubit.get(context).type,
                                    title: Text(
                                      'Customer',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                    tileColor: Colors.deepPurple.shade50,
                                    dense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0)),
                                    onChanged: (value) {
                                      RegisterCubit.get(context)
                                          .selectValue(value!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      FadeAnimation(
                          1.10,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Visibility(
                              visible: RegisterCubit.get(context).isWorker,
                              child: SizedBox(
                                height: 60.0,
                                width: double.infinity,
                                child: DropdownButtonFormField(
                                  items: RegisterCubit.get(context)
                                      .Craftlist
                                      .map((String option) {
                                    return DropdownMenuItem<String>(
                                      value: option,
                                      child: Text(option),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    RegisterCubit.get(context)
                                        .changeOption(value.toString());
                                  },
                                  hint: const Text('Choose Your Craft'),
                                  iconSize: 30.0,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                  elevation: 10,
                                  iconEnabledColor: Colors.blue,
                                  iconDisabledColor: Colors.black12,
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(50.0),
                                  dropdownColor: Colors.white,
                                ),
                              ),
                            ),
                          )),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      FadeAnimation(
                          1.11,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                            child: Visibility(
                              visible: RegisterCubit.get(context).isWorker,
                              child: TextField(
                                controller:
                                RegisterCubit.get(context).desccontroller,
                                maxLines: 2,
                                decoration: const InputDecoration(
                                  // prefixIcon: Icon(Icons.message_outlined),
                                  labelText: 'Describe Your Work',
                                  hintText:
                                  'if you choose Worker you should describe your work....',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                onSubmitted: (value) {
                                  if (RegisterKey.currentState!.validate()) {
                                    final fullbirthdate =
                                        '${RegisterCubit.get(context).yearController.text.trim()} - ${RegisterCubit.get(context).monthController.text.trim()} - ${RegisterCubit.get(context).dayController.text.trim()}';
                                    RegisterCubit.get(context).userRegister(
                                      image: RegisterCubit.get(context).profileImage!.path,
                                      name: RegisterCubit.get(context)
                                          .namecontroller
                                          .text.trim(),
                                      email: RegisterCubit.get(context)
                                          .emailcontroller
                                          .text.trim(),
                                      password: RegisterCubit.get(context)
                                          .passcontroller
                                          .text,
                                      passwordConfirm: RegisterCubit.get(context)
                                          .comfpasscontroller
                                          .text,
                                      phone: RegisterCubit.get(context).phone.trim(),
                                      birthdate: fullbirthdate.trim(),
                                      national_id: RegisterCubit.get(context)
                                          .Nidcontroller
                                          .text.trim(),
                                      city: RegisterCubit.get(context)
                                          .cityController
                                          .text.trim(),
                                      role: RegisterCubit.get(context).type,
                                      job_title:
                                      RegisterCubit.get(context).optionValue.trim(),
                                      description: RegisterCubit.get(context)
                                          .desccontroller
                                          .text.trim(),
                                      Nidimage: RegisterCubit.get(context).NIDImage!.path,
                                    );
                                  }
                                },
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      FadeAnimation(
                          1.6,
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: default_Button(
                                function: () {
                                  if (RegisterKey.currentState!.validate()) {
                                    final fullbirthdate =
                                        '${RegisterCubit.get(context).yearController.text.trim()} - ${RegisterCubit.get(context).monthController.text.trim()} - ${RegisterCubit.get(context).dayController.text.trim()}';

                                    RegisterCubit.get(context).userRegister(
                                      image: RegisterCubit.get(context).profileImage!.path,
                                      name: RegisterCubit.get(context)
                                          .namecontroller
                                          .text.trim(),
                                      email: RegisterCubit.get(context)
                                          .emailcontroller
                                          .text.trim(),
                                      password: RegisterCubit.get(context)
                                          .passcontroller
                                          .text,
                                      passwordConfirm:
                                      RegisterCubit.get(context)
                                          .comfpasscontroller
                                          .text,
                                      phone: RegisterCubit.get(context).phone.trim(),
                                      birthdate: fullbirthdate.trim(),
                                      national_id: RegisterCubit.get(context)
                                          .Nidcontroller
                                          .text.trim(),
                                      city: RegisterCubit.get(context)
                                          .cityController
                                          .text.trim(),
                                      role: RegisterCubit.get(context).type.trim(),
                                      job_title: RegisterCubit.get(context)
                                          .optionValue.trim(),
                                      description: RegisterCubit.get(context)
                                          .desccontroller
                                          .text.trim(),
                                      Nidimage: RegisterCubit.get(context).NIDImage!.path,
                                    );
                                  }
                                },
                                text: 'Sign up',
                                isUpperCase: false,
                                textStyle: null,
                              ),
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          )),
                      //  SizedBox(
                      //   //height: 10.0,
                      // ),
                      FadeAnimation(
                          1.14,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login_Screen(),
                                      ),
                                    );
                                  },
                                  child: const Text('Login Now'))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


Widget bottomSheet(BuildContext context, RegisterCubit cubit) {
  var size = MediaQuery.of(context).size;
  return Container(
    //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    width: double.infinity,
    height: size.height * 0.3,
    margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      // color: color,
    ),
    // color: Colors.black,
    child: Column(
      children: [
        const Text(
          'Choose a Profile Photo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    cubit.getImageProfileFromGallery();
                  },
                  child: Icon(
                    Icons.image,
                    color: Color(0xff4377ec),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xff4377ec),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 80.0,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    cubit.getImageProfileFromCamera();
                  },
                  child: Icon(
                    Icons.camera,
                    color: Color(0xff4377ec),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Camera',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xff4377ec),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


Widget bottomSheetForNid(BuildContext context, RegisterCubit cubit) {
  var size = MediaQuery.of(context).size;
  return Container(
    //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    width: double.infinity,
    height: size.height * 0.3,
    margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    decoration: new BoxDecoration(
      shape: BoxShape.circle,
      // color: color,
    ),
    // color: Colors.black,
    child: Column(
      children: [
        const Text(
          'Choose a Profile Photo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    cubit.getImageNIDFromGallery();
                  },
                  child: Icon(
                    Icons.image,
                    color: Color(0xff4377ec),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xff4377ec),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 80.0,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    cubit.getImageNIDFromCamera();
                  },
                  child: Icon(
                    Icons.camera,
                    color: Color(0xff4377ec),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Camera',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xff4377ec),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


