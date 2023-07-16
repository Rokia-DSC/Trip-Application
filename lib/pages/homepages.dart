import 'package:flutter/material.dart';
import 'package:tripapp/pages/fadeAnimation.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  PageController? _pageController;
  int totalPage =3;

  void _onScroll(){

  }
  @override
  void initState(){
    _pageController!.dispose();
    super.dispose();
  }

  @override
  void dispose(){
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(page: 1,image: 'lib/images/alvan-nee-ZCHj_2lJP00-unsplash.jpg',title: 'Roky',description: 'The Maine Coon is a native New England breed that hailed from Maine. They were a very popular farm cat, mouser and most likely a ship cat up until the early 19th century. This breed is very good natured and adapts well too many different lifestyles and personalities. They like people being around them but they aren’t necessarily clingy. The mouser trait has still been passed down for many generations so expect your home to be rodent free.'),
          makePage(page: 2,image: 'lib/images/amber-kipp-75715CVEJhI-unsplash.jpg',title: 'Kitty',description: 'The Maine Coon is a native New England breed that hailed from Maine. They were a very popular farm cat, mouser and most likely a ship cat up until the early 19th century. This breed is very good natured and adapts well too many different lifestyles and personalities. They like people being around them but they aren’t necessarily clingy. The mouser trait has still been passed down for many generations so expect your home to be rodent free.'),
          makePage(page: 3,image: 'lib/images/bogdan-farca-CEx86maLUSc-unsplash.jpg',title: 'Memo',description: 'The Maine Coon is a native New England breed that hailed from Maine. They were a very popular farm cat, mouser and most likely a ship cat up until the early 19th century. This breed is very good natured and adapts well too many different lifestyles and personalities. They like people being around them but they aren’t necessarily clingy. The mouser trait has still been passed down for many generations so expect your home to be rodent free. '),

        ],
      ),
    );
  }
  Widget makePage({image, title,description,page}){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3,0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(page.toString(),style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text('/' + totalPage.toString(),style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),),
                ],
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnmation(1,
                   Text(title,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(Icons.star,color: Colors.yellow,size: 15,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(Icons.star,color: Colors.yellow,size: 15,),
                      ),
                      Container(
                        margin:const EdgeInsets.only(right: 3),
                        child: const Icon(Icons.star,color: Colors.yellow,size: 15,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(Icons.star,color: Colors.yellow,size: 15,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(Icons.star,color: Colors.grey,size: 15,),
                      ),
                      const Text('4.0', style: TextStyle(color: Colors.white70),),
                      const Text('(2300)', style: TextStyle(color: Colors.white30,fontSize: 12),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(description,style: TextStyle(color: Colors.white.withOpacity(.7),height: 1.9,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 20,),
                  const Text('READ MORE',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 30,),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
