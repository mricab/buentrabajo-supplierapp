import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supplierapp/utils/camera.dart';

class AvatarFormField extends FormField<String> {
  AvatarFormField({
    //Avatar
    double avatarRadius = 40,
    Widget avatarHint = const Icon(
      Icons.add_a_photo_outlined,
      color: Colors.white54,
    ),
    Color avatarBackground = Colors.grey,
    //Form Field
    BuildContext context,
    FormFieldSetter<String> onSaved,
    String initialValue,
    FormFieldValidator<String> validator,
    FormFieldState<String> state,
    bool autovalidate = false,
    TextEditingController controller,
    //Modal
    Color modalBackgroundColor = Colors.white,
    Text modalCameraLabel =
        const Text('Take a Picture', style: TextStyle(color: Colors.black)),
    Text modalGalleryLabel =
        const Text('Pick a Picture', style: TextStyle(color: Colors.black)),
    Icon modalCameraIcon = const Icon(Icons.camera, color: Colors.black),
    Icon modalGalleryIcon = const Icon(Icons.photo, color: Colors.black),
  }) : super(
            onSaved: (value) {
              controller.text = value;
            },
            initialValue: initialValue,
            validator: validator,
            builder: (state) {
              var photoMgr = PhotoManager();
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                          backgroundColor: modalBackgroundColor,
                          context: context,
                          builder: ((builder) => Container(
                                padding: EdgeInsets.fromLTRB(25, 25, 25, 35),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton.icon(
                                        onPressed: () async {
                                          await photoMgr.getImageFromCamera();
                                          state.didChange(photoMgr.img.path);
                                          state.save();
                                        },
                                        icon: modalCameraIcon,
                                        label: modalCameraLabel),
                                    FlatButton.icon(
                                        onPressed: () async {
                                          await photoMgr.getImageFromGallery();
                                          state.didChange(photoMgr.img.path);
                                          state.save();
                                        },
                                        icon: modalGalleryIcon,
                                        label: modalGalleryLabel),
                                  ],
                                ),
                              )),
                        );
                      },
                      child: Column(
                        children: [
                          (state.value == null)
                              ? CircleAvatar(
                                  backgroundColor: avatarBackground,
                                  child:
                                      (state.value == null) ? avatarHint : null,
                                  minRadius: avatarRadius,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(state.value),
                                    width: avatarRadius * 2,
                                    height: avatarRadius * 2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    state.hasError
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              state.errorText,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            });
}
