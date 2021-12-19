import 'package:flutter/material.dart';
import 'package:netflix_replica/widgets/widgets.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    List scaffolds = [
      scaffoldInicio(screenSize),
      scaffoldSearch(),
      scaffoldProx(),
      scaffoldConfig(),
    ];
    return scaffolds[_currentIndex];
  }

  Scaffold scaffoldConfig() {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _bottomNavigationBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Perfiles y más',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 108,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, i) {
                    return _perfilImage(i);
                  }),
            ),
            SizedBox(
              width: 215,
              child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white60,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Administrar perfiles',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Icon(Icons.message_outlined, color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '''Háblales a todos tus amigos de 
Netflix.''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.25,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Text(
                      '''
Comparte este enlace para que tus amigos puedan
participar en las conversaciones sobre todas tus series
y películas favoritas.
          ''',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Términos y condiciones',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Share.share('https://www.netflix.com/es/');
                          },
                          backgroundColor: Colors.grey.shade600,
                          child: Icon(Icons.share, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade800),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Icon(Icons.check, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mi lista',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Text(
                    'Configuración de la aplicación',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Text(
                  'Cuenta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'gmaps');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Text(
                    'Localización',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold scaffoldSearch() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: double.infinity,
            child: Text(
              'Búsqueda',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(color: Colors.grey.shade800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: _crearInput(),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Títulos más buscados',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 22.5),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 1),
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade900,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    'assets/rick_morty.jpeg',
                                    width: 140,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Rick y Morty',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                            Icons.play_circle_outline_sharp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Scaffold scaffoldProx() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: double.infinity,
            child: Text(
              'Próximamente',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
      body: Column(
        children: [
          ListTile(
              leading: Icon(Icons.notifications_none, color: Colors.white),
              title: Text(
                'Notificaciones',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/vikingos.webp'),
                                        fit: BoxFit.fill)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 125,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/vikings_logo.png'),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      _iconText(
                                          Icon(Icons.notifications_none,
                                              color: Colors.white),
                                          'Recordármelo'),
                                      _iconText(
                                          Icon(Icons.info_outline,
                                              color: Colors.white),
                                          'Información')
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Temporada 1, estreno mañana',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white60),
                                      ),
                                      SizedBox(height: 12),
                                      Text('Vikingos',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(height: 5),
                                      Text(
                                        'Este descarnado drama narra las hazañas del héroe vikingo Ragnar Lothbrok a medida que extiende el dominio escandinavo desafiando a un líder carente de visión.',
                                        maxLines: 3,
                                        textAlign: TextAlign.justify,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white60),
                                      ),
                                      SizedBox(height: 12),
                                      mainInfoRow('Violencia', 'Sexo', 'Sangre',
                                          'Suspenso', 'Historia'),
                                      SizedBox(height: 12),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  SizedBox _iconText(Icon icono, String text) {
    return SizedBox(
      width: 100,
      height: 55,
      child: IconButton(
        onPressed: () {},
        icon: Column(
          children: [
            icono,
            Text(text, style: TextStyle(fontSize: 10, color: Colors.white60))
          ],
        ),
      ),
    );
  }

  Widget _perfilImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: 62.5,
                height: 62.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1258518578573250561/j7BqTLYc_400x400.jpg'),
                    )),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Pepe',
                style: TextStyle(
                  color: index == 2 ? Colors.white : Colors.white60,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextFormField(
      cursorColor: Colors.white,
      autofocus: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Buscar...',
        hintStyle: TextStyle(color: Colors.white38),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.mic, color: Colors.white60),
        ),
        icon: Icon(Icons.search, color: Colors.white60),
      ),
      onChanged: (valor) {},
    );
  }

  Scaffold scaffoldInicio(Size screenSize) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: PreferredSize(
            child: CustomAppBar(
              scrollOffset: _scrollOffset,
            ),
            preferredSize: Size(screenSize.width, 50)),
        body: bodyInicio());
  }

  CustomScrollView bodyInicio() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Image.asset(
                'assets/vikingos.webp',
              ),
              Positioned.fill(
                  child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ))
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
              child: mainInfoRow(
                  'Violencia', 'Sexo', 'Sangre', 'Suspenso', 'Historia'),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    Text('Mi lista',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                        )),
                  ],
                ),
                MaterialButton(
                  color: Colors.white,
                  minWidth: 100,
                  onPressed: () {},
                  child: Row(children: [
                    Icon(Icons.play_arrow),
                    Text('Reproducir',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                  ]),
                ),
                Column(
                  children: [
                    Icon(Icons.info_outline, color: Colors.white),
                    Text('Información',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                        )),
                  ],
                )
              ],
            )
          ],
        )),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 20,
        )),
        _contentList('Series TV'),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 20,
        )),
        _contentList('Seguir viendo para Pepe'),
        SliverToBoxAdapter(
          child: Container(
            height: 2000,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter _contentList(String title) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage('assets/good_doctor.webp')),
                  ),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 125,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
              _currentIndex = index;
            }),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Próximas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ]);
  }
}
