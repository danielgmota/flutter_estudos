class DispararTarefa extends StatefulWidget {
  static final String routeName = 'DispararTarefa';
  TodosTimes todostimes;

  DispararTarefa(this.todostimes);

  @override
  State<StatefulWidget> createState() {
    return new _DispararTarefaState(todostimes);
  }
}

class _DispararTarefaState extends State<DispararTarefa> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences _sharedPreferences;
  var _authToken,
      _id,
      _name,
      _timeSelecionado,
      dropdownValue,
      items,
      responseJson,
      list;

  TodosTimes todostimes;

  TextEditingController tituloTarefa = TextEditingController();

  _DispararTarefaState(this.todostimes);

  var lista = [
    {"TimeID": "7", "TimeNome": "SoftServ Sistemas"},
    {"TimeID": "11", "TimeNome": "Suporte GTfat"},
    {"TimeID": "14", "TimeNome": "Desenvolvimento Web RHpag"},
    {"TimeID": "15", "TimeNome": "Comercial"},
    {"TimeID": "33", "TimeNome": "Financeiro"},
    {"TimeID": "36", "TimeNome": "Suporte PABXserv"},
    {"TimeID": "37", "TimeNome": "Desenvolvimento Web FLOWserv"},
    {"TimeID": "38", "TimeNome": "Suporte COntb/FScal"},
    {"TimeID": "39", "TimeNome": "Suporte RHpag"},
    {"TimeID": "48", "TimeNome": "Infraestrutura"},
    {"TimeID": "51", "TimeNome": "Marketing"},
    {"TimeID": "53", "TimeNome": "Desenvolvimento RHpag"},
    {"TimeID": "54", "TimeNome": "Desenvolvimento COntb"},
    {"TimeID": "55", "TimeNome": "Desenvolvimento GTfat"},
    {"TimeID": "56", "TimeNome": "Desenvolvimento FScal"}
  ];

  @override
  void initState() {
    super.initState();
    responseJson = json.decode(lista);
    todostimes = TodosTimes.fromJson(responseJson);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Nova tarefa"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new Center(
        child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
    scrollDirection: Axis.vertical,
    child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //alinhar esquerda crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "Título Tarefa",
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  controller: tituloTarefa,
                ),
                Text(''),
                Text('Selecione o time:'),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5),
                    children: todostimes.times.map((s) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _timeSelecionado = s;
                            });
                          },
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  border: Border.all(
                                      color: s == _timeSelecionado
                                          ? Colors.deepPurple
                                          : Colors.grey[400],
                                      width: 2.0)
                              ),
                              width: 200.0, //valor fixo
                              //convertDouble(s['TimeNome'].toString()) ,
                              padding: EdgeInsets.all(2.0),
                              child: Text(s['TimeNome'],
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                  )
                              ),
                            ),
                          ));
                    }).toList(),
                  ),
                ),
                Text(''),
                RaisedButton(
                  child: Text('Disparar',
                      style: new TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0
                  ),
                  elevation: 5.0,
                  splashColor: Colors.white70,
                  onPressed: ()  {
                    
                  },
                ),
              ]))),
        );
  }

  class TodosTimes {
  List times;

  TodosTimes.fromJson(teste) {
    times = teste['Times'];
  }
}