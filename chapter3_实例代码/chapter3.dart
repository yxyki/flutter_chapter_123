// ignore_for_file: avoid_print, prefer_final_fields

import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Home---基础组件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              child: const Text("ButtonFcn"),
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ButtonFcn(
                      title: 'Button',
                    );
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("ImageFcn"),
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ImageFcn();
                  }),
                );
              },
            ),
            ElevatedButton(
              child: const Text("登录界面"),
              onPressed: () {
                //导航到新路由
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const FocusTestRoute();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonFcn extends StatelessWidget {
  const ButtonFcn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('按钮组件'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "这是按钮组件演示",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: const Color.fromARGB(255, 7, 7, 7),
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: Paint()
                    ..color = const Color.fromARGB(255, 63, 163, 27),
                  //decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("发送"),
                  onPressed: () {
                    print('发送');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("添加"),
                  onPressed: () {
                    print('添加');
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.info),
                  label: const Text("详情"),
                  onPressed: () {
                    print('详情');
                  },
                ),
              ],
            ),
          ],
        ));
  }
}

class ImageFcn extends StatelessWidget {
  const ImageFcn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加载图片'),
      ),
      body: Center(
        child: Column(
            children: <Image>[
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fill),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.none),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.contain),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.cover),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fitWidth),
          Image.asset('images/Zombatar_1.png',
              width: 100, height: 50, fit: BoxFit.fitHeight)
        ].map((e) {
          return Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString(),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2,
                      fontFamily: "Courier",
                      background: Paint()
                        ..color = const Color.fromARGB(255, 213, 250, 6)))
            ],
          );
        }).toList()),
      ),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({Key? key}) : super(key: key);

  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  bool? checked = false;
  var _state = 0;

  void animateProgress() {
    setState(() {
      _state = 1;
    });
    setState(() {
      Timer(const Duration(milliseconds: 3000), () {
        setState(() {
          _state = 0;
        });
      });
    });
  }

  Widget? _setUpChild() {
    if (_state == 0) {
      return const Text(
        "登录",
        style: TextStyle(color: Colors.white),
      );
    } else if (_state == 1) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录界面'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
            buildKuang(context),
            const SizedBox(
              height: 10.0,
            ),
            PrivacyWidget(
              onChanged: (value) {
                checked = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKuang(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _unameController,
            decoration: const InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              icon: Icon(Icons.person),
            ),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _setUpChild(),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_state == 0) {
                          animateProgress();
                        } else {
                          return;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<bool?> onChanged;

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: checked,
            onChanged: (value) {
              widget.onChanged(value);
              setState(() {
                checked = value;
              });
            }),
        const Text(
          '同意',
          style: TextStyle(fontSize: 14.0),
        ),
        const Text(
          '<服务协议>',
          style: TextStyle(fontSize: 14.0, color: Colors.blue),
        ),
        const Text(
          '和',
          style: TextStyle(fontSize: 14.0),
        ),
        const Text('<隐私政策>',
            style: TextStyle(fontSize: 14.0, color: Colors.blue)),
      ],
    );
  }
}
