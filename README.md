# flutter_app
概念
Widget
1、分为两种，一种是可变StatefulWidget、一种是不可变StatelessWidget
1)Text、Row、Column 和 Container都是继承自StatelessWidget
StatelessWidget生命周期：
初始化
build

StatefulWidget生命周期：



Context


State

InheritedWidget
InheritedWidget 允许在 widget 树中有效地向下传播（和共享）信息。
当有多个Widget需要用到相同的数据时，传递数据很混乱，这时采用InheritedWidget将数据存储起来，随用随取，



BuildContext\Element
Element implements BuildContext