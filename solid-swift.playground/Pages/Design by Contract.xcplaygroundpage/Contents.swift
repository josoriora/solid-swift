//: [Previous](@previous)


/*:
# Design by Contract:

Methods define preconditions and postconditions.

Preconditions cannot be strengthened in a subtype.

Postconditions cannot be weakened in a subtype.

Invariants of the supertype must be preserved in a subtype
 
 We can talk about three different kind of contracts: invariant, precondition and post condition. Invariant is belonging to a class, pre- and post conditions are belonging to a method.

 An invariant is nothing else than a restriction on the state of your class. The state of your class is basically the value of your class variables. For example if you have a class for right-angled triangles your class variables can be: the length of a side, the the length of b side and the the length of c side of the triangle. These variables with their current values represent the state of your class. We know the rule: a*a + b*b = c*c in case of a right-angled triangle. That means if our class stands for right-angled triangle all values which are not fulfilling this condition are invalid, they are not representing a right-angled triangle. So this logical expression (a*a + b*b = c*c) can be your class invariant. This should be true in all cases. It will be checked: at the end of your constructor, at starting any of your class methods and at the end of your class methods. Next to that it is a good practise to keep you class variables private and reach them through setter and getter functions, so that your class can never get an invalid state which is not fulfilling the invariant.

 The precondition of a method is a condition checked before starting your method. For example if you have a stretch function for your triangle which is having a parameter called factor your precondition can be that this parameter is greater than 0.

 The postcondifition of a method. is checked at the end of the function, it is describing what you are expecting from your method. In case of the stretch function in could be something similar: a = old(a) * factor and b = old(b) * factor and c = old(c) * factor, where old means the value at the start of the method. Here it is also important that you need to think about the whole state of your class. So if it has attributes which should not be changed by the method it should be also specified in the post condition. For example if your representation has also a colour attribute than the post condition should be extended with: colour = old(colour).

 Until now it is simple: each method has a pre- and a postcondition and the class has an invariant which is checked after construction and at the start and at the end of each function.

 Contracts for sub classes

 How does it change if your class has a base class?

 Your class is holding the invariant of all of its base classes. So in case of one base class the following needs to be always fulfilled: invariant_of_base_class and invariant_of_your_class. So from a child class you can not break the invariant of the base class.

 For example if the right-angled triangle class is derived from a triangle class, an invariant for the triangle class can be: a + b >= c (the sum of length of the two shorter side should be at least the length of the longest side). This invariant should be fulfilled also by the right-angled triangles.

 Regarding pre- and post condition:

 For an overridden function precondition can not be strengthened as the precondition in the base class. So it can be less strength (like instead of (a < 10 and b < 10) just (a < 10)) or the same as in base class.

 For an overridden function postcondition can not be weakened as the postcondition in the base class. So it can be the same or more strength.

 And this is called Liskov substitution principle, which is part of SOLID principles.

 Maybe it is a bit complicated for the first time, but it says nothing else than: your subclass is a special case of your base class, so it should work for all inputs which are working with the base class and it should produce the same results as well.
 
 https://dev.to/rlxdprogrammer/design-by-contract---learn-something-new-about-oop-4jfd#:~:text=This%20principle%20is%20the%20following,desirable%20properties%20of%20that%20program%E2%80%9D.
*/

//: [Next](@next)
