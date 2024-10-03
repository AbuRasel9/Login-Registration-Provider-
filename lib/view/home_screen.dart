import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/provider/meme_list_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getData() async {
    final provider = context.read<MemeListProvider>();
    provider.setLoading(loading: true);
    await provider.getMemeData();
    provider.setLoading(loading: false);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();


    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final memeProvider = Provider.of<MemeListProvider>(context);
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: memeProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: memeProvider.memeList?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,),
                      margin: EdgeInsets.only(bottom: 10),

                      decoration:  const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            height: 200,
                            width: double.infinity,
                            memeProvider.memeList?[index].url ?? "",
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            memeProvider.memeList?[index].name ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                memeProvider.memeList?[index].id ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                              ),
                              Text(
                                memeProvider.memeList?[index].captions.toString() ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )),
    );
  }
}
