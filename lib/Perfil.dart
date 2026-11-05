import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil>{
  final pesquisa = TextEditingController();
  String? mensagemErro;

  void validarPesquisa(String valor){
    setState(() {
      if (valor.trim().isEmpty){
        mensagemErro = "Digite qual receita deseja buscar.";
      } else {
        mensagemErro = null;
      }
    });
  }

  void executarPesquisa(){
    final textoBusca = pesquisa.text;
    validarPesquisa(textoBusca);

    if (mensagemErro !=  null) return;

    final termoValido = textoBusca.trim();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Buscando resultados para '$termoValido'"),
          backgroundColor: const Color.fromRGBO(67, 19, 117, 1.0),
        ),
    );
  }

  @override
  void dispose(){
    pesquisa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 233, 255, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text(
                "SAVEUR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(67, 19, 117, 1.0),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fantasy',
                  fontSize: 48,
                  letterSpacing: 4.0,
                ),
              ),
              const SizedBox(height: 48),

              TextField(
                controller: pesquisa,
                onChanged: (valor){
                  if (mensagemErro != null) validarPesquisa(valor);
                },
                decoration: InputDecoration(
                  labelText: "Buscar receita",
                  errorText: mensagemErro,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(67, 19, 117, 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color.fromRGBO(67, 19, 117, 1.0), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Color.fromRGBO(67, 19, 117, 1.0), width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: executarPesquisa,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(160, 143, 216, 1.0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "Pesquisar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Color.fromRGBO(67, 19, 117, 1.0), width: 1.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 233, 255, 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.cookie,
                          size: 50,
                          color: Color.fromRGBO(67, 19, 117, 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cookie",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "1 h | Médio",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "4,9/5",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Color.fromRGBO(67, 19, 117, 1.0), width: 1.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 233, 255, 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.cake,
                          size: 50,
                          color: Color.fromRGBO(67, 19, 117, 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bolo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "40 min | Fácil",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "4,7/5",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        indicatorColor: Color.fromRGBO(240, 233, 255, 1.0),
        selectedIndex: 0,
        onDestinationSelected: (int index){

        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search, color: Color.fromRGBO(67, 19, 117, 1.0)),
              label: 'Explorar',),
          NavigationDestination(icon: Icon(Icons.favorite_border, color: Color.fromRGBO(67, 19, 117, 1.0)),
              label: 'Favoritos')
        ],
      ),
    );
  }
}
