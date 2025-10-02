import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  double valorAltura = 1.90;
  double valorPeso = 60;
  String frase = "Preencha os campos";
  String sexo = "Homem";

  calculaIMC(peso, altura){
    double resultado = peso / (altura * altura);

    if(resultado < 18.5){
      setState(() {
        frase = "$sexo, ${valorAltura.toStringAsFixed(2)} m de altura, pesando ${valorPeso.toStringAsFixed(0)} kg: Abaixo do peso";
      });
    } else if(resultado >= 18.5 && resultado <= 24.9){
      setState(() {
        frase = "$sexo, ${valorAltura.toStringAsFixed(2)} m de altura, pesando ${valorPeso.toStringAsFixed(0)} kg: Peso normal";
      });
      
    } else if(resultado >= 25){
      setState(() {
        frase = "$sexo, ${valorAltura.toStringAsFixed(2)} m de altura, pesando ${valorPeso.toStringAsFixed(0)} kg: Acima o peso";
      });
  }
}

void incrementaAltura(){
  setState(() {
    valorAltura += 0.01;
  });
}

void decrementaAltura(){
  setState(() {
    valorAltura -= 0.01;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 60),
              child: Text("Escolha o seu gênero",
                style: TextStyle(
                  fontSize: 20
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sexo = "Homem";
                      });
                    },
                    child: Expanded(
                      child: Padding(padding: EdgeInsets.only(left: 10, bottom: 10, right: 5),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: sexo == "Homem" ? 5 : 0,
                              color: sexo == "Homem" ? Colors.blue : Colors.white
                            ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("imagens/masculino.png", width: 100),
                        ),
                      )
                    )
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        sexo = "Mulher";
                      });
                    },
                    child: Expanded(
                      child: Padding(padding: EdgeInsets.only(left: 5, bottom: 10, right: 10),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: sexo == "Mulher" ? 5 : 0,
                              color: sexo == "Mulher" ? Colors.pink : Colors.white
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("imagens/feminino.png", width: 100),
                        ),
                      )
                    )
                  )
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 60),
                        child: Column(
                          children: [
                            Text("Selecione a sua altura",
                              style: TextStyle(
                                fontSize: 15
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    incrementaAltura();
                                  },
                                  child: Icon(Icons.arrow_upward),
                                ),
                                Text("${valorAltura.toStringAsFixed(2)} m"),
                                GestureDetector(
                                  onTap: (){
                                    decrementaAltura();
                                  },
                                  child: Icon(Icons.arrow_downward)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 15),
                            child: Text("Selecione o seu peso",
                              style: TextStyle(
                                fontSize: 15
                              ),
                            ),
                          ),
                          Slider(
                            value: valorPeso,
                            min: 1,
                            max: 200,
                            divisions: 200,
                            label: valorPeso.toStringAsFixed(0),
                            onChanged: (novoValorPeso) {
                              setState(() {
                                valorPeso = novoValorPeso;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50, bottom: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(400, 40)
                ),
                onPressed: (){
                  calculaIMC(valorPeso, valorAltura);
                },
                child: Text("Calcular",
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              )
            ),
            Text(frase,
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      ),
    );
  }
}
