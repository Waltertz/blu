import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

CollectionReference studentCollectionReference = FirebaseFirestore.instance.collection("Student");
CollectionReference teacherCollectionReference = FirebaseFirestore.instance.collection("Teacher");
CollectionReference parentCollectionReference = FirebaseFirestore.instance.collection("Parent");
firebase_storage.Reference? reference;

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
