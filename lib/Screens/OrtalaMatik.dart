import 'package:flutter/material.dart';
import 'package:ortalamatik/Model/sınav.dart';

class ortalamatikPage extends StatefulWidget {
  const ortalamatikPage({super.key});

  @override
  State<ortalamatikPage> createState() => _ortalamatikPageState();
}

TextEditingController _dersAdi = TextEditingController();
TextEditingController _dersNotu = TextEditingController();
String _credi = "1";
var items = [
  '1',
  '2',
  '3',
  '4',
  '5',
];

double ortalama = 0.0;
List<sinav> dersler = [];

class _ortalamatikPageState extends State<ortalamatikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ortalamatik",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow[400],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              value: items.first,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text("$value Kredi"),
                                );
                              }).toList(),
                              onChanged: (selectedValue) {
                                _credi = selectedValue!;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextFormField(
                              controller: _dersNotu,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Ders Notu",
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 17, bottom: 17, right: 20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                          controller: _dersAdi,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Ders Adı",
                            hintStyle: const TextStyle(
                                color: Colors.black, fontSize: 22),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20, top: 17, bottom: 17, right: 20),
                          ),
                        ),
                ),
                Container(
                  height: 3,
                  color: Colors.yellow[200],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ortalama:",
                      style: TextStyle(fontSize: 27),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "0.0",
                      style: TextStyle(fontSize: 27, color: Colors.black),
                    ) // matematik sıfır, yetişmedi,
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 3,
                  color: Colors.yellow[200],
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dersler.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    setState(() {
                      var item = dersler.firstWhere(
                          (element) => element.id == dersler[index].id);
                      dersler.remove(item);
                    });
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            dersler[index].isim,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Container(height: 1, color: Colors.black),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "kredi:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(dersler[index].kredi.toString(),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.red)),
                                ],
                              ),
                              const SizedBox(width: 30),
                              Row(
                                children: [
                                  const Text(
                                    "Not:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    dersler[index].not.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            color: const Color.fromARGB(255, 255, 237, 183),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Not:",
                    style: TextStyle(
                        color: Color.fromARGB(255, 234, 16, 0), fontSize: 20),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "silmek için basılı tutun",
                    style: TextStyle(color: Color.fromARGB(255, 184, 147, 147), fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD9C82C),
        onPressed: () {
          if (_dersAdi.text == "") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Hata"),
                content: const Text("Ders adı girin."),
                actions: [
                  TextButton(
                    child: const Text("Tamam"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else if (_dersNotu.text == "") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Hata"),
                content: const Text("Ders notu girin."),
                actions: [
                  TextButton(
                    child: const Text("Tamam"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          } else {
            setState(() {
              dersler.add(
                sinav(dersler.isEmpty ? 0 : dersler.length + 1, _dersAdi.text,
                    int.parse(_credi), double.parse(_dersNotu.text)),
              );
            });
            _dersAdi.clear();
            _dersNotu.clear();
          }
          print(dersler);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
