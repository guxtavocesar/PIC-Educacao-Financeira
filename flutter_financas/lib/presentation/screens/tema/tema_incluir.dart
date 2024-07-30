import 'package:flutter/material.dart';
import 'package:flutter_financas/presentation/themes/colors_constants.dart';
import 'package:flutter_financas/presentation/widgets/app_bar.dart';
import 'package:flutter_financas/presentation/widgets/bottom_bar.dart';
import 'package:flutter_financas/presentation/widgets/button.dart';
import 'package:flutter_financas/presentation/widgets/input.dart';

class TemaInclusaoScreen extends StatefulWidget {
  static const routeName = '/tema/incluir';

  const TemaInclusaoScreen({super.key});

  @override
  State<TemaInclusaoScreen> createState() => _TemaInclusaoScreenState();
}

class _TemaInclusaoScreenState extends State<TemaInclusaoScreen> {

  // Lista de ícones disponíveis
  final List<Map<String, dynamic>> _icons = [
    {'nome': 'Alarme', 'icon': Icons.access_alarm},
    {'nome': 'Conta', 'icon': Icons.account_circle},
    {'nome': 'Adicionar Foto', 'icon': Icons.add_a_photo},
    {'nome': 'Aeroporto', 'icon': Icons.airport_shuttle},
    {'nome': 'Acesso', 'icon': Icons.beach_access},
    {'nome': 'Bolo', 'icon': Icons.cake},
    {'nome': 'Dashboard', 'icon': Icons.dashboard},
    {'nome': 'E-mail', 'icon': Icons.email},
    {'nome': 'Favorito', 'icon': Icons.favorite},
    {'nome': 'Home', 'icon': Icons.home},
    {'nome': 'Escola', 'icon': Icons.school},
  ];

  // Ícone selecionado pelo usuário
  IconData _selectedIcon = Icons.home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(title: 'Adicionar Tema'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'Nome',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: const SizedBox(
                        width: 350,
                        child: Input(
                          placeholderText: 'Informe o nome do tema',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'Descrição',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: const SizedBox(
                        width: 350,
                        child: Input(
                          placeholderText: 'Informe a descrição do tema',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 350,
                    child: Text(
                      'Ícone',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: const SizedBox(
                        width: 350,
                        child: Input(
                          placeholderText: 'Informe a descrição para o ícone',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    color: ColorConstants.primaryColor,
                    child: SizedBox(
                      width: 350,
                      height: 175,
                      child: Icon(
                        _selectedIcon,
                        size: 150,
                        color: ColorConstants.thirdColor,
                      ),
                    )
                  ),
                  DropdownButton<IconData>(
                    value: _selectedIcon,
                    icon: const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: ColorConstants.primaryColor,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: ColorConstants.primaryColor),
                    underline: Container(
                      height: 2,
                      color: ColorConstants.primaryColor,
                    ),
                    onChanged: (IconData? newValue) {
                      setState(() {
                        _selectedIcon = newValue!;
                      });
                    },
                    items: _icons.map<DropdownMenuItem<IconData>>((Map<String, dynamic> icon){
                      return DropdownMenuItem<IconData>(
                        value: icon['icon'],
                        child: Row(
                          children: [
                            Icon(icon['icon'], color: ColorConstants.secondColor),
                            const SizedBox(width: 10),
                            Text(icon['nome']),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 350,
                        child: Button(
                          onPressed: () {},
                          textButton: 'Adicionar tema'
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
          )
        ),
        bottomNavigationBar: const CustomNavigationBarHome(),
      )
    );
  }
}
