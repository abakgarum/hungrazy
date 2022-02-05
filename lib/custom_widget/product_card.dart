import 'package:flutter/material.dart';
import 'package:hungrazy/model/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quentity = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      widget.product.imagePath,
                      fit: BoxFit.fill,
                      height: 120,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '9:00 AM - 10:00 PM',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),
                      // Text(
                      //   'This is the description of the food. You can read this text to understand more about food.',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Rs. 100',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                '20',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Text(
                              '% Off',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        widget.product.price,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        widget.product.unit,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          !widget.product.isAddedToCart
                              ? Expanded(
                                  flex: 2,
                                  child: Card(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black87),
                                        elevation:
                                            MaterialStateProperty.all(5.0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.product.isAddedToCart = true;
                                        });
                                      },
                                      child: Text('Add'),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  flex: 5,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (quentity <= 1) {
                                                  widget.product.isAddedToCart =
                                                      false;
                                                } else {
                                                  quentity--;
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.red[500],
                                               size: 30,
                                            )),
                                      ),
                                      Text(
                                        '$quentity',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quentity++;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.green[500],
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
