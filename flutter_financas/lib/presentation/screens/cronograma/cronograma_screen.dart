import 'package:flutter/material.dart';
import 'package:flutter_financas/presentation/screens/cronograma/calendario_screen.dart';
import 'package:flutter_financas/presentation/screens/desafio/desafio_incluir_screen.dart';
import 'package:flutter_financas/presentation/themes/colors_constants.dart';
import 'package:flutter_financas/presentation/widgets/app_bar.dart';
import 'package:flutter_financas/presentation/widgets/bottom_bar.dart';
import 'package:flutter_financas/presentation/widgets/button.dart';
import 'package:flutter_financas/presentation/widgets/list.dart';

class CronogramaScreen extends StatefulWidget {
  static const routeName = '/cronograma';

  const CronogramaScreen({super.key});

  @override
  State<CronogramaScreen> createState() => _CronogramaScreenState();
}

class _CronogramaScreenState extends State<CronogramaScreen> {

  // Lista de cronogramas e suas respectivas semanas
  final List<Map<String, dynamic>> desafios = [
    {'desafio': 'AVALIAÇÃO DE BENEFÍCIOS DE SEGUROS', 'dificuldade': 'INTERMEDIÁRIO'},
    {'desafio': 'COMPARAÇÃO DE PLANOS DE SEGUROS', 'dificuldade': 'FÁCIL'},
    {'desafio': 'AVALIAÇÃO DE NECESSIDADES DE SEGURO', 'dificuldade': 'DIFÍCIL'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(title: 'Cronograma'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    color: ColorConstants.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5, right: 15, bottom: 15, left: 15),
                              child: const Text(
                                'DESAFIOS DA SEMANA',
                                style: TextStyle(
                                  color: ColorConstants.thirdColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                softWrap: true, // Habilita a quebra automática de linha
                                overflow: TextOverflow.visible, // Garante que o texto seja exibido completo, mesmo que ultrapasse o limite
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: desafios.length,
                    itemBuilder: (context, index) {
                      return SimpleList(
                        title: desafios[index]['desafio'],
                        subtitle: desafios[index]['dificuldade'],
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: ShortButton(
                      onPressed: () {},
                      textButton: 'VISUALIZAR TODOS OS DESAFIOS DA SEMANA'
                    )
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Text(
                          'GERENCIAR CRONOGRAMAS',
                          style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w900
                          ),
                        )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: 375,
                          height: 75,
                          child: LargeButtonWithIcon(
                            textButton: 'PROGRAMAR NOVA SEMANA',
                            icon: Icons.bookmark_add,
                            onPressed: () {
                              // Navegação através de rotas nomeadas
                              
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: 375,
                          height: 75,
                          child: LargeButtonWithIcon(
                            textButton: 'ADICIONAR NOVO DESAFIO',
                            icon: Icons.bookmark_add,
                            onPressed: () {
                              // Navegação através de rotas nomeadas
                              Navigator.pushNamed(context, DesafioIncluirScreen.routeName);
                            }
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: 375,
                          height: 75,
                          child: LargeButtonWithIcon(
                            textButton: 'CALENDÁRIO',
                            icon: Icons.calendar_month,
                            onPressed: () {
                              // Navegação através de rotas nomeadas
                              Navigator.pushNamed(context, CalendarioScreen.routeName);
                            }
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBarHome(),
      ),
    );
  }
}