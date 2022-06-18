import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const cred = r'''
{
  "type": "service_account",
  "project_id": "hybrid-poetry-353617",
  "private_key_id": "3424c72f3bad0d72e90fc4cfa1dcef3ffaa80bb5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDFf8gLnkZYRhdM\nCfQZhyg/mxST2k3tZjKdVoUCX2/krdUsN0yeTpnPESIcE+NDmOlKJoqoOOt+aTwx\nFMM3x/Ggto9CQtfMAFx7eu8DmIY1zfOtDqe9Ttz+xS5kn9P7kGhxeWDKVPya3Ckc\njveI7b/I8xXoOTnusPMBHfnZoKeSbRCAhPperLC7Dpa10KWsVN7iCPFOX5xzNUiA\nHVtwpMXmM+3KRcNN/3ok9+TY2zJKhwgzpHXWTNqyUjG3PKORKbbCTSos3RCAo7cU\nUf6Cm178dw8SKqIk+WxISZXJiTNy1RodUafJwZXF9fjLwIHUmLlZCVrR1we9UMOS\n/ibhNjeBAgMBAAECggEAIOhxxL3SqtLC/wCJk9dZdX+5pgkyAuSMenr4HrUYR9pP\nMtbkBVzDdCU+sb7+lzzbYmeZov4Y/y85wFPdU2YVdNn2dOv+WReWUVziho7bjguL\nFsLiYEDLwgfI+ytGfxxIyt+WqSAQFx2oHAIWbNJwqmMWu2MNrB//3afJAeIrCdKn\nb5uYWYYXLkLjJrlGyAulC3/UWgh5bObe9pY1WrSC+rfWVrINsPoRpQQUvXC0UrpR\nHIZ4vKYZsIuUgZDv2PWDWZWQoNet2Zpw9pcYqgsSNs+5JsYYWTAgAcr3qAnS0qd9\nM8I9nSoc+lhCRwWwTCKYq357frztl5/HuWKWF0MzIQKBgQDsEL77z1vxaYx8Wo5T\nhDAhKT6Y7wDpT23Ce9gjocGb6LoeTHpfjAj9jMrHWpDol/ICPxwN+wp/3AIne5Ph\nOwwWASKO2nby0IB9WCdKeoGRiSgkEPA4XjZv5/ro87PUrUpRxY+BY2BUp26c7wT1\nAYJaO2NDKXiv22xWLZ8t3FcT0wKBgQDWLU+nayfYiPkpUoc1bmqTi0pBQr/0d5r8\nCuaaP48Cn6MLulzShrQ4uWzW8MDGhcpiQT+zvUd1IBUIPKgp0TUoXw78UgQ/ao0g\n9G3cs84fLR7oOhJ8jDx8zNOccsZMqYspOlOnQgCeOZmhRWJLVA0RtESXoQtYtqF9\nH1y8Bfd22wKBgD5tM0Q+Es9lnSwpemflliC+2nnxAmmwgpMi0wahOST0x3tJuDba\nPmpmuB09+wI3ZF1puQ6Na7piQQOV74ZpagnLpQroBPqzXrdG/6T3fpoxDjdzb0NI\nztaLH1RJVi4Q4Y18VDXgRNI+MMc5gjMUghdAi0BwkCTZPu4PRIAJO9HXAoGATY6S\n7ZlMEIlpUKFl/N9DELK77O3y/N/i66o231xsuRJ9xF10B3hoArKCy0LbTAhexT3D\nh57fJXa8pwLwElSD316s2ooIp7455Nkef3FNDtUUABwnXZqavMafSmP1kwVCM2e/\nqy2nc6SAEXpCoeyJ3wNcY1wZ88IOsHSO7Dds6UkCgYEAyXFV4R0iYlkgSp+fpNC8\nTfRvQziC/G5xYJL/E7Cdpq/8bILuw+3GS798o+fVFaZiWPKCJMyOHPcxAV0Bxalw\n+I3EXoUrcFx94/aUovfoLEyf3Ziq/Mth2Kdq5p8YoVrh9LCluFEh784ebYxC0B9Z\nsgAyT66LbsFur2+/qNNkQKU=\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@hybrid-poetry-353617.iam.gserviceaccount.com",
  "client_id": "108389374824374288650",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40hybrid-poetry-353617.iam.gserviceaccount.com"
}
''';
const spid = '1G4Wo_d9rdSGq6CbGQagvhBYgKmIK1cA1Jcy0eP6P5m4';
void main() async {
  final gs = GSheets(cred);
  final ss = await gs.spreadsheet(spid);
  var ws = ss.worksheetByTitle("Sheet1");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var gs;
  var ss;
  var ws;
  int nr = 0;
  int nrt = 0;
  List<String> a = [];
  TextEditingController c1 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intial();
  }

  void intial() async {
    gs = GSheets(cred);
    ss = await gs.spreadsheet(spid);
    ws = ss.worksheetByTitle("Sheet1");
    await countrows();
  }

  void postnote() {
    setState(() {
      a.add(c1.text);
    });
    
    c1.clear();
  }

  Future countrows() async {
    while ((await ws!.values.value(column: 1, row: nr + 1)) != '') {
      nrt++;
    }
    loadnotes();
  }

  void loadnotes() async {
    for (int i = 0; i < nr; i++) {
      String newnote = (await ws!.values.value(column: 1, row: i + 1));
      if (a.length < nr) {
        a.add(newnote);
      }
    }
    await ws.values.appendRow([c1.text]);
    nr++;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      title: "Stick Notes",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sticky Notes"),
          backgroundColor: Colors.pink,
        ),
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: a.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (Container(
                      child: Center(
                        child: Text(a[index]),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.yellow[500],
                          borderRadius: BorderRadius.circular(8)),
                    )),
                  );
                },
              ),
            ),
            Container(
              color: Colors.grey[400],
              child: Column(
                children: [
                  TextField(
                    controller: c1,
                    decoration: InputDecoration(
                      hintText: "Enter",
                      suffixIcon: IconButton(
                        onPressed: () {
                          c1.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      postnote();
                    },
                    color: Colors.pink,
                    child: Text(
                      "POST",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
