import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key,
    required this.itemName,
    required this.description,
    required this.price,
    required this.image}) : super(key: key);

  final String? itemName;
  final String? description;
  final int? price;
  final String? image;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade200,elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/safeeat.png',scale: 3,),
                    Text(widget.itemName.toString(),style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),
                    Text(widget.description.toString(),style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 13
                    ),),
                    Text(widget.price.toString(),style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),

                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(30),
                          bottomRight:Radius.circular(30) ),
                      child: Image.network(widget.image.toString(),
                        errorBuilder: (context, error,stack){
                        return const Icon(Icons.error, color: Colors.red,);
                        },
                        scale: 1,fit: BoxFit.fitWidth,width: 140,)),
                  counter==0?
                  Positioned(
                    bottom: 13,
                    right: 30,
                    left: 30,
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        counter++;
                      });

                    }, style: ElevatedButton.styleFrom(
                        minimumSize:const Size(60, 25),
                        maximumSize: const Size(60, 25),
                        backgroundColor: Colors.white
                    ),
                        child:const Text('add',style: TextStyle(
                            color: Colors.blue
                        ),)
                    ),
                  ):Positioned(
                    bottom: 25,
                    left: 30,
                    right: 30,
                    child: Container(
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 0,),
                            InkWell(onTap: (){
                              setState(() {
                                counter--;
                              });
                            },
                                child: const Text('-',style: TextStyle(color: Colors.blue,fontSize: 20),)),
                            Text('$counter',style: const TextStyle(color: Colors.blue),),
                            InkWell(onTap: (){
                              counter++;
                              setState(() {
                              });
                            },
                                child: const Text('+',style: TextStyle(color: Colors.blue,fontSize: 20),)),
                            const SizedBox(width: 0,),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),],
        ),
      ),

    );
  }
}
