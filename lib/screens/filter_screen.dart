import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';

  final Map<String, bool> currentFilters;
  final Function saveFliters;

  FilterScreen(this.currentFilters, this.saveFliters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  Widget _buildSwitchTile(
      String title, String subtitle, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (newValue) => updateValue(newValue),
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactose = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFlitered = {
                'gluten': _glutenFree,
                'lactose': _lactose,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFliters(selectedFlitered);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  _lactose,
                  (newValue) {
                    setState(() {
                      _lactose = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
