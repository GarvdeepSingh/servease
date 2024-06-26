import 'package:flutter/material.dart';


class Categorymodel {
  final String name;
  final IconData icon;
  final bool active;


  Categorymodel({required this.name,required this.icon,required this.active});
}



List Categorydata =[
  Categorymodel(name: "Electrician", icon: Icons.lightbulb_outline,active: true),
  Categorymodel(name: "Plumber", icon: Icons.plumbing_outlined,active: false),
  Categorymodel(name: "Gardener", icon: Icons.grass_outlined,active: false),
  Categorymodel(name: "Maid", icon: Icons.house,active: false),
  Categorymodel(name: "Cook", icon: Icons.food_bank_outlined,active: false),
  Categorymodel(name: "Ironing", icon: Icons.iron_outlined,active: false),
  Categorymodel(name: "Car wash", icon: Icons.local_car_wash_outlined,active: false),
  Categorymodel(name: "Painter", icon: Icons.color_lens_outlined,active: false),
  Categorymodel(name: "Picker", icon: Icons.cleaning_services_outlined,active: false),

];