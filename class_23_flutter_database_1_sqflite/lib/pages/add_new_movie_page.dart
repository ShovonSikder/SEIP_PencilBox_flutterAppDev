import 'dart:io';

import 'package:class_23_flutter_database_1_sqflite/models/movie_model.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/constants.dart';
import 'package:class_23_flutter_database_1_sqflite/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class AddNewMovie extends StatefulWidget {
  static const String routeName = '/addNewMovie';
  const AddNewMovie({Key? key}) : super(key: key);

  @override
  State<AddNewMovie> createState() => _AddNewMovieState();
}

class _AddNewMovieState extends State<AddNewMovie> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final budgetController = TextEditingController();
  final descriptionController = TextEditingController();
  String? selectedType;
  String? selectDate;
  String? imagePath;
  int? id;
  late MovieProvider provider;
  @override
  void didChangeDependencies() {
    provider = Provider.of<MovieProvider>(context, listen: false);
    id = ModalRoute.of(context)!.settings.arguments as int?;
    if (id != null) {
      _setData();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    budgetController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          id == null ? 'Add New Movie' : 'Update Movie Info',
        ),
        actions: [
          TextButton(
            onPressed: () {
              saveMovie();
            },
            child: Text(
              id == null ? 'save'.toUpperCase() : 'update'.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Add New Movie',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Movie Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Movie name is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
                hint: Text(
                  'Select Movie Type',
                ),
                value: selectedType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.blue,
                    ),
                  ),
                ),
                items: moviteTypes
                    .map(
                      (movie) => DropdownMenuItem<String>(
                        value: movie,
                        child: Text(
                          movie!,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedType = item;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: budgetController,
              decoration: InputDecoration(
                hintText: 'Movie Budget\$',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Movie budget is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Movie Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Movie description is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    pickDate();
                  },
                  icon: Icon(
                    Icons.date_range_outlined,
                    size: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    pickDate();
                  },
                  child: Text(
                    'Select Date',
                  ),
                ),
                Text(
                  selectDate != null ? '$selectDate' : 'No Date chosen',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                imagePath == null
                    ? Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(
                            imagePath!,
                          ),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                IconButton(
                    onPressed: () {
                      imagePick();
                    },
                    icon: Icon(
                      Icons.image,
                      color: Colors.blue,
                    )),
                TextButton(
                  onPressed: () {
                    imagePick();
                  },
                  child: Text(
                    'Select Image',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null) {
      selectDate = getFormatedDate(pickedDate, datePattern);
      setState(() {});
    } else {
      selectDate = null;
      setState(() {});
    }
  }

  void imagePick() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.path;
      setState(() {});
    }
  }

  void saveMovie() {
    if (selectDate == null) {
      showMsg(
        context,
        'Please Select a Date',
      );
      return;
    }
    if (imagePath == null) {
      showMsg(
        context,
        'Please Select an Image',
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      final movieModel = MovieModel(
        name: nameController.text,
        image: imagePath!,
        description: descriptionController.text,
        budget: double.parse(budgetController.text),
        type: selectedType!,
        releaseDate: selectDate!,
      );

      if (id != null) {
        movieModel.id = id;
        provider.updateMovie(movieModel).then((value) {
          provider.getAllMovies();
          Navigator.pop(context, movieModel.name);
          showMsg(
            context,
            'Info Updated',
          );
        }).catchError((error) {
          showMsg(context, error.toString());
        });
      } else {
        provider.insertMovie(movieModel).then((value) {
          provider.getAllMovies();
          Navigator.pop(context);
          showMsg(
            context,
            'New Movie Added',
          );
        }).catchError((error) {
          showMsg(context, error.toString());
        });
      }
    }
  }

  void _setData() {
    final movie = provider.getMovieFromList(id!);
    nameController.text = movie.name;
    descriptionController.text = movie.description;
    budgetController.text = movie.budget.toString();

    selectedType = movie.type;
    imagePath = movie.image;
    selectDate = movie.releaseDate;
  }
}
