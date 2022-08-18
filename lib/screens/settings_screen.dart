import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/filters.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen( this.onSettingschanged, this.filters, {Key? key})
      : super(key: key);

  final Filters filters;
  final Function(Filters) onSettingschanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Filters filters;

  void initState() {
    super.initState();
    filters = widget.filters;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingschanged(filters);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Gluten',
                  'Só exibe refeições sem gluten.',
                  filters.isGlutenFree,
                  (value) => setState(() => filters.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose.',
                  filters.isLactoseFree,
                  (value) => setState(() => filters.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas.',
                  filters.isVegan,
                  (value) => setState(() => filters.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetariana.',
                  filters.isVegetarian,
                  (value) => setState(() => filters.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
