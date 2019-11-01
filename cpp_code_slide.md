## This is code slide collection of cpp

### pseducode template
        <font color="green">
            Pseducode

            <code>
        </font>

    [check](#10fuck)
    <a name="10fuck"></a>

<font color="green" size="6">
fucckkkkk
</font>

## Preface

1. [Design](#A)
1. [Idiom](#B00)
2. [Basic & OOP ](#B)
    1. [c++ itself](#B1)
    1. [c++ oop](#B2)
    1. [c++ generic](#B3)
    1. [c++ funcitonal](#B4)
2. [MetaProgramming & black magic](#C)
2. [Unordered topic](#Dunorderedtopic)
2. [Code slide](#E)
2. [Interview Q & A](#F)

<a name="A"></a>

<font color="green" size="6">
    <a name="A"></a>
### Design
</font>

### design pattern

* [all in one patterns, see the buttom of this page, you can find all patterns in software](https://en.wikipedia.org/wiki/Software_design_pattern)
    * Creation Pattern

        1. [abstract factory vs factory](https://www.zhihu.com/question/20367734/answer/15088661)

    * Structural Pattern
    * Behavior Pattern
    * Concurrency Pattern (see more in mind_recalling.md)
    * And Architectural Pattern ( not my work )

##### Concurrency Pattern (see more in mind_recalling.md)
##### OOP paradigm and design pattern

* [cpp oop design pattern](https://en.wikibooks.org/wiki/C%2B%2B_Programming/Code/Design_Patterns#Factory)

* [反思oop](https://www.zhihu.com/question/19728806)
    * Disadvantage of observer : it would introduce strong coupling when inherite from observer-base class. In cpp, we can use Signal/Slots pattern to subtitue Observer pattern. [ref](http://stackoverflow.com/questions/312895/what-are-signals-and-slots) , read << linux多线程服务器编程》1.14
* OOP [this is generic-oop](http://wcook.blogspot.com.br/2012/07/proposal-for-simplified-modern.html)
    cpp-oop is not that good as java, you need careful use. 
    Like virtual method and library ABI. see *'pimpl'* idiom. [pimpl idiom](http://en.cppreference.com/w/cpp/language/pimpl)
    Like inheritance, like few classes used in STD.
    * encapsulate, polymorphic, inheritance : encapsulate-> see less, handle less, change less; inheritance-> to elimate duplicate code; polymorphic-> Interface!!!

    * the rule of virtual function is, how you call is defined by class definition, but what the calling is bound is defined by inheritance.

    * a oop-language should have following feature

        1. shared with non-oop code 
        2. class & object 
        3. dynamic dispatch(looking up the method at run time in a table associated with object) 
        4. encapsulation(data and modifying function together and private public constrait) 
        5. composition, inheritance and delegation. composition : object can contain other object, inheritance : all feature in parent would be included in child, delegation : another language feature can be an alternative to inheritance
        6. polymorphism, the method of parent can be called and work fine for it's descendants. 7.open recursion, object methods can call other methods
        7. open recursive, methods can call other method in the same object

    * oop-design priciple [ref](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design), [oop design principle](http://www.cnblogs.com/gaochundong/p/single_responsibility_principle.html)
      1. Single responsibility principle : 需求变的时候，我只需要改变与需求对应的某一个类。否则，代码的抽象是错误的。
      2. Open close principle : 需求改变时，总可以通过添加代码实现，而不用修改代码。否则，代码的抽象是错误的。
      3. Liskov substition principle : 使用基类，不需要知道衍生类的实现。否则，接口就没有意义了。
      4. Interface segregation principle : 当衍生类需要某个东西的时候，而基类的定义或者其他衍生类不需要的时候。通过其他方式实现，而不要破坏基类的接口。否则，接口就乱七八糟的了。
      5. Dedenpency inversion principle : 当一个类需求另一个类时，不要用直接的依赖关系，用间接的，比如在一个抽象的方法里使用被依赖类。这样，设计上层模块时（依赖者）就不需要因为下层（被依赖者）的改变而改变。否则，上层模块就很难复用。
      6. Least knowledge principle : 避免直接调用某一个类的api的次数。如果一件事需要调用多个api，可以抽象为一个类。

<font color="green" size="6">
    <a name="B00"></a>
### Cpp idioms [ref](https://en.wikibooks.org/wiki/More_C%2B%2B_Idioms)
</font>

* handle / body idiom --> technical for large scale cpp project

<font color="green" size="6">
    <a name="B"></a>
### Basic & Normal
</font>

<font color="green" size="6">
    <a name="B1"></a>
c++ itself
</font>

* bind reference [ref](http://stackoverflow.com/questions/15681691/difference-between-returning-a-const-reference-and-rvalue-reference) 
    0. A const reference can bind to anything. 
    1. An rvalue reference can only bind to non-const rvalues.
    2. rvalues can bind to rvalue references and const lvalue references [ref](https://stackoverflow.com/questions/17980570/pass-by-reference-constant-reference-rvalue-reference-or-constant-rvalue-refe) why c++11 introduce rvalue reference? because you can't bind rvalue to lvalue reference, and you must copy temporary value all through function stack.  

* lvalue rvalue xvalue glvalue prvalue universal reference 
.[ref](https://isocpp.org/blog/2012/11/universal-references-in-c11-scott-meyers) 
.[ref](http://stackoverflow.com/questions/3601602/what-are-rvalues-lvalues-xvalues-glvalues-and-prvalues)
.[ref](https://stackoverflow.com/questions/27364787/glvalue-real-examples-and-explanation)
.[code slide](#lvaluervalue)

* Mutable and volitate [ref](http://hedengcheng.com/?p=725) , [ref](http://blog.csdn.net/qidi_huang/article/details/52588105)

* different meaning for **const and static** 

    * const has multiple meaning

        * const member, const generally means you can never assign to it. As a const variable, it was initialized once, for const class member, it must be initialized with constructor, where you can put this init in the init list, or some [magic](http://stackoverflow.com/questions/11575637/can-const-member-variable-of-class-be-initialized-in-a-method-instead-of-constru), also check this cpp design [princinple](http://stackoverflow.com/questions/14495536/how-to-initialize-const-member-variable-in-a-class-c)

    * static has multiple meaning 

        1. static variable in 'non-namespace scope'. [ref](http://stackoverflow.com/questions/6223355/static-variables-in-class-methods)

        2. static variable in namespace scope, 'internal linkage' & '(static duration)store in data or bss segment'. note that global variable without static is accessiable between translation unit, which is only 'static duration'.

        3. static function [ref](http://stackoverflow.com/questions/558122/what-is-a-static-function) Dima's answer. can only be used in 'this unit'.

        4. static member and method [ref](http://www.learncpp.com/cpp-tutorial/812-static-member-functions/) [ref](http://stackoverflow.com/questions/40413715/initialization-of-static-const-member-map-in-class-definition)
            >Because static member functions are not attached to a particular object, they can be called directly by using the class name and the scope resolution operator.
            >##### You have to define your static member outside the class definition and provide the initializer there. 
                
                //static member
                class worker
                {
                private:
                    static const std::map<std::string, std::string> m_;
                };

                const std::map<std::string, std::string> worker::m_ = {
                  { "foo", "bar"  },
                  { "abc", "def"  },
                };

        5. static variable initialization thread safe[ref](https://stackoverflow.com/questions/8102125/is-local-static-variable-initialization-thread-safe-in-c11)

* *inline* is more like *extern static* as a hint than a directives, used almost exclusively by the linker, not the compiler. 
[ref](http://stackoverflow.com/questions/1759300/when-should-i-write-the-keyword-inline-for-a-function-method)
[ref](http://en.cppreference.com/w/cpp/language/inline)
inline is fast in some situation because it would spend less time in function call and return parts.
    > what can inline do? 
    > 1. to telling that *something* existing in multiple translate unit, *like full special template in a .h file would need to be inline*.
    > 2. caller to inline-some, and inline-some must be in one translate unit. When this constrait fulfill, compiler may do something to optimize the performance for inline-some.


* **universal reference or forward reference & reference collapse**
[ref](https://isocpp.org/blog/2012/11/universal-references-in-c11-scott-meyers)
&& + & -> &
&& + && -> &&
& + & -> &

* Conversions : **you should mentioned that some conversion is for obj, some for reference**
    1. const_cast, 
    2. static_cast, would do some check.
    3. dynamic_cast, **sometimes we need store a derive pointer from base, virtual funciton is not suit for all situation** [ref-puppy said](https://stackoverflow.com/questions/5776777/what-is-the-proper-use-case-for-dynamic-cast), 
        > How works ? It would check the Type_info one word before 'virtual func table' to safe cast.
    4. reinterpret_cast,  **All reinterpret_cast does is allow you to read the memory you passed in a different way.** [ref](https://stackoverflow.com/questions/18544849/how-to-use-reinterpret-cast-in-c)
    5. c-style explicit type conversion, won't do an check.
    6. operator overloading user-defined conversion : note that, compiler would consider 'only one type conversion'
    7. implicit conversion(user-define conversion) : if you define a 'explicit' constructor, compiler won't consider an 'implicit' one in 'implicit' context.  

* name mangling : 作为一种面向对象的语言，C++支持函数重载，而过程式语言C则不支持。函数被C++编译后在symbol库中的名字与C语言的不同。例如，假设某个函数的原型为：    void foo(int x, int y);   
        该函数被C编译器编译后在symbol库中的名字为_foo，而C++编译器则会产生像_foo_int_int之类的名字。_foo_int_int这样的名字包含了函数名和函数参数数量及类型信息，C++就是考这种机制来实现函数重载的。   
        为了实现C和C++的混合编程，C++提供了C连接交换指定符号extern "C"来解决名字匹配问题，函数声明前加上extern "C"后，则编译器就会按照C语言的方式将该函数编译为_foo，这样C语言中就可以调用C++的函数了。

* shadow(hide) is non-intentional overwrite. Make clear about difference between override, overwrite and overload. **Important** overwrite don't have special meaning in cpp you can say it's shadow, hide for non-intentional or intentional overwrite.

* Overload operation [stack](https://stackoverflow.com/questions/4421706/what-are-the-basic-rules-and-idioms-for-operator-overloading), 
    > The binary operators = (assignment), [] (array subscription), -> (member access), as well as the n-ary () (function call) operator, must always be implemented as member functions, because the syntax of the language requires them to.

* const volatile [ref](http://stackoverflow.com/questions/4557979/when-to-use-volatile-with-multi-threading) Do not use volatile except in low-level code that deals directly with hardware.

* constexpr [ref](http://stackoverflow.com/questions/4748083/when-should-you-use-constexpr-capability-in-c11)

* POD, a type is POD when the only thing in it are build-in types and combinations of them. No constructor, destructor, virtual method.

* unique_ptr & weak_ptr & shared_ptr best practice [ref](http://stackoverflow.com/questions/12030650/when-is-stdweak-ptr-useful)
    0. Almostly weak_ptr are used to those shared_ptr like pointers in concurrency environment, weak_ptr can detect whether one object is live, and when dereference, lock() it to shared_ptr.
    0. another situation to use weak_ptr is when you have two shared_ptr reference to each other, you would never delete them. So, use weak_ptr here.
    1. How shared_ptr and weak_ptr work? they both have 'counter' and 'pointee', when shared_ptr counter is zero, pointee is deleted, but, counter exist unless every weak_ptr is also deleted. [ref](https://stackoverflow.com/questions/5671241/how-does-weak-ptr-work)
    2. enable_shared_from_this, we usually need to return a shared_ptr point to 'this', if you forcely return 'shared_ptr(this)' would cause multiple shared_ptr own this pointer and would cause double 'delete'. [blog](http://blog.guorongfei.com/2017/01/25/enbale-shared-from-this-implementaion/)

* ownership : single ownership vs shared owenership, just that one or multiple handle(smart pointer) instance refer to one heap Resource. This concept is strongly tied with the concept of variable lifetimes, that is A own B, means if A exist, B is here. Ownership also appears with RAII to make sure one resource is here as long as the RAII-object, until this RAII-object destructed, which means your fd won't be close and opened agian with the same value.

* pass array

    >So we cannot pass an array by value, and when we pass an array to a function, we are actually passing a pointer to the array's first element.
    >In this question, const int ia[10] is actually same as const int*, and the size of the array is irrelevant. we can pass const int ia[3] or const int ia[255], there are no differences. If we want to pass an array which size is ten, we should use reference like this : (Primer 5th)
    >    void print10(const int (&ia)[10]) { /*...*/ }

<font color="green" size="6">
    <a name="B2"></a>
c++ oop
</font>

* **C++ oop basic ALL IN ONE** [oop code slide](#oopbasiccodeslide)
    * construct / destruct 
        * the rule of three/five/zero [ref](http://en.cppreference.com/w/cpp/language/rule_of_three)
        * use swap in move constructor and define your swap : default swap require copy constructible and copy assignable, but, when the swaped ob is just a handle to big real data, it would be very inefficient for it to copy real data.  so to class like this, do your own swap method as [code slide](#yourswap)
        * Synthesis constructor and synthesis destructor [ref](http://stackoverflow.com/questions/9635772/is-it-true-that-a-default-constructor-is-synthesized-for-every-class-that-does-n), in one word, synthesis constructor will be generated when programmer didn't provide one and so do synthesis destructor.

            * **= default** constructor [ref](http://stackoverflow.com/questions/19559503/call-to-implicitly-deleted-copy-constructor-in-llvm)
            >"default means : If the defaulted versiones of constructors make sense, they will be defined as defaulted. Otherwise, it will be defined as deleted."   
             primer 5th : p667 : "Unlike the copy operations, a move operation is never implicitly defined as a deleted function"

    * override operator
        * operator() :
        * operator= :
        * **postfix vs prefix add operator** [ref](https://stackoverflow.com/questions/24901/is-there-a-performance-difference-between-i-and-i-in-c)

    * Access control
        * private protected public    [ref](http://stackoverflow.com/questions/860339/difference-between-private-public-and-protected-inheritance)
        * friend [ref](http://stackoverflow.com/questions/17434/when-should-you-use-friend-in-c)
        The 'friend' specifier allows the designated class access to protected data or functionality within the class making the friend statement.
        * using scope operator to use hidden members, following code would directs the compiler to look for member in the scope of class Base.
            ```cpp
              struct Derived : Base {
                  int get_base_mem() {return Base::mem;}
              }   
            ```

    * c++ 内存对象模型 ： [ref](http://www.cnblogs.com/QG-whz/p/4909359.html)  ,菱形继承中，虚基类指针指向虚基类表，表里是一些偏移量,用来找到虚继承最左父类的虚函数表,和多继承一样，会扩展最左父类的虚基类表。

    * Polymorphism 
        * polymorphism cast is for **pointer and reference**, you can't cast object, unless them have convertion constructor.
        * upcasted . Following is code. Relatively, downcasting is conversion of pointer or ref from base to derive, while upcasting is conversion from derive to base with the help of 'dynamical_cast', (without explict dynamical_cast)
              
            ```cpp
              Base* p_base = &derive_var;
              p_base->base_virtual_func();
              //upcasted, polymorphism, implementation of derive is called

              Base base_var = derive_var;
              base_var.base_virtual_func();
              //upcasted, but slice cast, implementation of base is called
            ```
        * downcast

            ```cpp
                subpoint s;
                point & a = s;
                subpoint & b1 = static_cast<subpoint&>(a);
                subpoint & b2 = dynamic_cast<subpoint&>(a);
            ```

* Class(Type) design : For cpp, data abstraction is value-semantic, while obect-oriented is object-semantic. value-semantic means this can be copy, and object-semantic means copy from this is meaningless or abuse. Data abstraction type is also defined by it's operation, like objecct-oriented, though it's value-semantic and copiable. Object-based is something google said "better c, c with class"

| data sbstraction   | object-based                                 | object-oriented  |
| ------------------ | -------------------------------------------- | ---------------- |
| value-semantic     | object-semantic                              | object-semantic  |
| may have oop-stuff | oop-stuff not inheritance and virtual method | all of oop-stuff |

* RAII (Resource acquisition is initialization)

<font color="green" size="6">
    <a name="B3"></a>
c++ generic
</font>

* Effective cpp 41 :
    1. OOP : about explicit interfaces and runtime object polymorphism [check me](#oopexplicit)
    2. T&GP : about implicit interfaces and compile-time instantiation type polymorphism [check me](#t&gpimplicit)
    3. **NOTE** OOP have more coupling than GP

* A tiny stl library [github ref](https://github.com/mendsley/tinystl/tree/master/include/TINYSTL), [blog](https://www.kancloud.cn/digest/mystl/192550)

* Bind [ref](http://blog.guorongfei.com/2017/01/27/bind-implementation/)

<font color="green" size="6">
    <a name="B4"></a>
c++ functional
</font>

* Closure : a lambda function is a closure type, in computer scenice, closure means a record storing a function together with an environment.

* Functor vs Predicate

    * Functor (obeject)
    [ref](http://stackoverflow.com/questions/356950/c-functors-and-their-uses) [ref](http://en.cppreference.com/w/cpp/concept/FunctionObject)

    * Predicate( type )
    [ref](http://en.cppreference.com/w/cpp/concept/Predicate) [ref](http://stackoverflow.com/questions/5921609/what-is-predicate-in-c)
        >In other words, if an algorithm takes a Predicate pred and an iterator first, it should be able to test the iterator using the predicate via a construct like ** if (pred(\*first)) {...}. **






<font color="green" size="6">
    <a name="C"></a>
### MetaProgramming & Other Black Magic 
</font>

* Boost Graph Library [csdn](http://blog.csdn.net/magicblue/article/details/4208976) [comparing with lemon](http://blog.sommer-forst.de/tag/lemon-vs-boost/)

* introduce to [Generic Programming Techniques](http://www.boost.org/community/generic_programming.html#introduction)
    1. Tag dispatching 
    2. Type Generators
    3. Object Generators
    4. Policy Classes

* RTTI (run time type information) + type_traits + basic_type = type support
    * RTTI [ref](https://en.wikibooks.org/wiki/C%2B%2B_Programming/RTTI), RTTI info(type_info) is stored at one higher byte than virtual table, used when *dynamic_cast*
    * SFINAE [ref](http://en.cppreference.com/w/cpp/language/sfinae). [SFINAE code slide](#SFINAE) is used to implement compile time polymophism. how it works : after specific, deduced, obtained template argument. In the process of TAS(template argument subtitution) for all overload candidate in one overload set, one TAS operation on one candi is not fatal Error. And TAS operation would going on others, unless there are no overload candidates, it's SFINAE Error.  [stackoverflow-ref](https://stackoverflow.com/questions/982808/c-sfinae-examples)
        0. Constrait with the typename a template can accept, by SFINAE and type_traits [templateonlyacceptcertaintypes](#templateonlyacceptcertaintypes)
        0. use enable_if  [enable_if](#enable_if)
    * Types and type traits. **Traits**, is used to get Type info in compile time.
        <a name="templateonlyacceptcertaintypes"></a>
        0. a template only accept specific typename [ref](https://stackoverflow.com/questions/874298/c-templates-that-accept-only-certain-types)
        1. Traits and Policies are both uninstantable. [ref](http://stackoverflow.com/questions/14718055/what-is-the-difference-between-a-trait-and-a-policy)
            1. **Traits** classes do not determine the type of the object. Instead, they provide additional information about a type, typically by defining typedefs or constants inside the trait.
            2. **Policies** are classes to inject behavior into parent class, typically through inheritance. For example, Allocators are policy template parameters of all STL containers.[check me](#traits), And In this way "You don't pay for what you don't use"
            ```cpp
            template<class T, class Allocator = std::allocator<T>> class vector;
            ```
        0. A type with const member is imutable : copy assignment with const member class [ref](http://stackoverflow.com/questions/11601998/assignment-of-class-with-const-member) const member will make synthesis copy assignment operator implicitly deleted. 

* Parameter pack vs Variadic arguments(va_list, Ellipsis) vs initializer_list, using ellipsis in modern cpp. [Ref](http://stackoverflow.com/questions/32270758/why-doesnt-c-support-strongly-typed-ellipsis) Ellipsis is inherited from C and has a little similar function with 'va_list', 
but since cpp pratices evolved. With stronger typing in c++11/14, two thing apears : 'initializer lists' and 'variadic templates'. **Note** there are three type of '...':
      
      void print(std::ostream&) {}
      template <typename T, typename... Args>
      void print(std::ostream& out, T const& t, Args const&... args) {
            print(out << t, args...);   // recurrsive, unless there are no args left
      }
        // typename... // to declare a variadic type
        // Args const&... // to declare a pack of arguments
        // args... // to unpack the pack in an expression


* std::forward vs std::move [ref](https://stackoverflow.com/questions/9671749/whats-the-difference-between-stdmove-and-stdforward)

* Reflection : [ref](http://stackoverflow.com/questions/41453/how-can-i-add-reflection-to-a-c-application)

* metaprogramming in cpp:
Hana is a (long-winded) constructive proof that heterogeneous computations are strictly more powerful than type-level computations, and that we can therefore express any type-level computation by an equivalent heterogeneous computation.
[hana](https://github.com/boostorg/hana)

* functional programming in c++ : 
[a pdf to begin](https://meetingcpp.com/tl_files/mcpp/slides/12/FunctionalProgrammingInC++11.pdf)

* template full specialize and partial specialize 
[how to define full specialize](https://stackoverflow.com/questions/4445654/multiple-definition-of-template-specialization-when-using-different-objects)
SFINAE also is based on this.

* A template metaprogram is a program written in c++ template syntax that executes inside the c++ compiler. And the result of this metaprogram, pieces of c++ source code, which are instantiated from template metaprogram, is then compiled as usual.
[a simple introduction](http://www.cs.rpi.edu/~musser/design/blitz/meta-art.html)
[two good resource : c++ template & modern c++ design](https://stackoverflow.com/questions/112277/best-introduction-to-c-template-metaprogramming)

<font color="green" size="6">
    <a name="Dunorderedtopic"></a>
### Unordered topic
</font>

* Optimization by compiler [see this example](#compileroptimization)

    1. **return value optimization (RVO)** is a compiler optimization that involves eliminating the temporary object created to hold a function's return value. **named return value optimization (NRVO)** is just for a name object. [blog about how they affects you](https://yq.aliyun.com/articles/5876)

    2. **constant folding** is the process of recognizing and evaluating constant expressions at compile time rather than computing them at runtime. [wikipedia](https://en.wikipedia.org/wiki/Constant_folding)

* Allocator, allocator decoupling memory allocation and object construct. to solve the memory fragment problem.

* Dealing with low-level 
    1. system call & library call  [ref](http://www.thegeekstuff.com/2012/07/system-calls-library-functions/) use library call always unless you have no option

* translation unit [ref](http://stackoverflow.com/questions/1106149/what-is-a-translation-unit-in-c)
* invalidating iterator rules : add, move would cause iterator invalid
* union : (1) is a struct (2) the difference between each member to base is 0 (3) big enough to hold all (4) the align method should satisfy all member.

<a name="fucksso"></a>
* short string optimization SSO [Ref](http://stackoverflow.com/questions/10315041/meaning-of-acronym-sso-in-the-context-of-stdstring)

      // implement is like
      class string {
          public:
              // all 83 member functions
          private:
              size_type m_size;
              union {
                  class {
                      // This is probably better designed as an array-like class
                      std::unique_ptr<char[]> m_data;
                      size_type m_capacity;

                  } m_large;
                  std::array<char, sizeof(m_large)> m_small;

              };

      };


* Storage class specifiers 
[cppreference](http://en.cppreference.com/w/cpp/language/storage_duration)
all you want about virable access and duration.

* stack unwinding: 
[ref](https://stackoverflow.com/questions/2331316/what-is-stack-unwinding)
is usually talked about in connection with exception handling, to make it not happen, use RAII.
* Inheritant from mutex !!! [ref](https://stackoverflow.com/questions/4425039/locking-via-inheritance-rather-than-composition)

* map[] operator discards const qualifier [ref](http://stackoverflow.com/questions/262853/c-map-access-discards-qualifiers-const)

* emplace_back vs push_back : you should know for big object, it's efficient to use emplace_back to avoid extra construction, 
    > emplace_back shouldn't take an argument of type vector::value_type, but instead variadic arguments that are forwarded to the constructor of the appended item


* Atomic objects are free of data reces 
[what is atomic](https://stackoverflow.com/questions/31978324/what-exactly-is-stdatomic)
[what level of atomic you can get](http://en.cppreference.com/w/cpp/atomic/memory_order)
    0. i++ 和 ++i是原子操作么? 不是, 假设两个cpu两次调用i++, 

        >⒈ CPU A(CPU A上所运行的进程，以下同）从内存单元把当前计数值⑵ 装载进它的寄存器中；

        >⒉ CPU B从内存单元把当前计数值⑵ 装载进它的寄存器中。

        >⒊ CPU A在它的寄存器中将计数值递减为1；

        >⒋ CPU B在它的寄存器中将计数值递减为1；

        >⒌ CPU A把修改后的计数值⑴写回内存单元。

        >⒍ CPU B把修改后的计数值⑴写回内存单元。

        >我们看到，内存里的计数值应该是0，然而它却是1。)

* vector<bool> pitfall, [ref](https://stackoverflow.com/questions/17794569/why-is-vectorbool-not-a-stl-container)

* 内存对齐,结构体以最长的成员对齐

* sizeof(空类) = 1, if 类有虚表 = 4.

* #pragma pack(2) 以2对齐

* can't use remove_if for associate container 
[ref](https://stackoverflow.com/questions/800955/remove-if-equivalent-for-stdmap)
[ref](https://stackoverflow.com/questions/29004092/using-remove-if-for-a-map-container)

* how to mix up c and c++ [isocpp](https://isocpp.org/wiki/faq/mixing-c-and-cpp#call-cpp)

* async await and corutine implement in cpp [check mind_recalling "Corutine & async await"]()

<font color="green" size="6">
    <a name="F"></a>
### Interview Q & A
</font>
### common interview question [ref](https://www.nowcoder.com/ta/nine-chapter/review?query=&asc=true&order=&page=15)
* dangler pointer vs wild pointer vs overflow vs memery leak

### End ( below is code slide and new added cards )

<font color="green" size="6">
    <a name="E"></a>
### Code slide
</font>

* your swap <a name="yourswap"></a>

        class Widget {
        public :
            void swap(Widget& other) {
                using std::swap;
                swap(my_pointer_, other.my_pointer_);
            }
        };

        // then specialization of std::swap

        namespace std {
        template<>
            void swap<Widget>(Widget& a, Widget& b) {
                a.swap(b);
            }
        }

    > default implement of swap

        namespace std {
            template<typename T>
                void swap(T&a, T&b) {
                    T temp(a);
                    a = b;
                    b = temp;
                }
        }

* throw_01

      if(BLABLA) {
        std::stringsteam msg;
        msg << __func__ << "BLABLA";
        throw std::invalid_argument(msg.str());
      }

* static_assert

      static_assert(std::is_copy_constructible<T>::value,
                  "Swap requires copying");     // And many other type support template

* bit operate [ref](http://stackoverflow.com/questions/47981/how-do-you-set-clear-and-toggle-a-single-bit-in-c-c)

      std::bitset<5> x;

      x[1] = 1;
      x[2] = 0;
      // Note x[0-4]  valid

      std::cout << x << std::endl;

  or you can

      number |= 1 << x;     //set a bit
      number &= ~(1 << x);  //clean
      number ^= 1 << x;     //toggle
      bit = (number >> x) & 1;              //check
      number ^= (-x ^ number) & (1 << n);   // change nth bit to x

  this problem present a great method to use bit manipulate, clever!!
  [ref](https://discuss.leetcode.com/topic/2031/challenge-me-thx/17)

  >The code seems tricky and hard to understand at first glance.
  However, if you consider the problem in Boolean algebra form, everything becomes clear.

  >What we need to do is to store the number of '1's of every bit. Since each of the 32 bits follow the same rules, we just need to consider 1 bit. We know a number appears 3 times at most, so we need 2 bits to store that. Now we have 4 state, 00, 01, 10 and 11, but we only need 3 of them.

  >In this solution, 00, 01 and 10 are chosen. Let 'ones' represents the first bit, 'twos' represents the second bit. Then we need to set rules for 'ones' and 'twos' so that they act as we hopes. The complete loop is 00->10->01->00(0->1->2->3/0).

  >For 'ones'(the first bit), we can get 'ones = ones ^ A[i]; if (twos == 1) then ones = 0', that can be tansformed to 'ones = (ones ^ A[i]) & ~twos'.

  >Similarly, for 'twos'(the second bit), we can get 'twos = twos ^ A[i]; if (ones* == 1) then twos = 0' and 'twos = (twos ^ A[i]) & ~ones'. Notice that 'ones*' is the value of 'ones' after calculation, that is why twos is
  calculated later.

* string by line

    ```cpp
      // stringstream, getline(), ispunct(),
      std::string line;
      vector<str::string> substr;
      while (std::getline(infile, line)) {
          std::stringstream ss(line);
          std::string tmp
          while (ss >> tmp) {
              substr.push_back(tmp);
          }
      }
        int main() {
        std::ifstream  data("test.txt");
        std::string line;
            while(std::getline(data,line)) {
                std::stringstream  lineStream(line);
                std::string        cell;
                while(std::getline(lineStream,cell,' ')) {
                    std::cout<<cell<<std::endl;
                }
            }
        }
    ```

* split string

    ```cpp
    vector<string> split(string a, char ch) {
        stringstream ss(a);
        vector<string> vec;
        while (getline(ss, item, ch)) {
            vec.push_back(item);
        }
        return vec;
    }
    ```

* Functor [ref](http://stackoverflow.com/questions/356950/c-functors-and-their-uses)   more flexible

    ```cpp
      struct add_x {
        add_x(int x) : x(x) {}
        int operator()(int y) const { return x + y; }

        private:
        int x;
      };
    ```

* error macro 

    ```cpp
        #define exit_if(r, ...) if(r) {\
        printf(__VA_ARGS__);\
        printf("%s:%d error no: %d error msg %s\n", __FILE__, __LINE, errno, strerror(errno));\
        exit(1);\
        }
              // use it like this :
              exit_if(r, "bind to 0.0.0.0:%d failed %d %s", port, errno, strerror(errno));
    ```

* namespace & scope

    ```cpp
      int a = 10;

      namespace N {
          int a = 100;
          void f() {
              int a = 1000;
              std::cout << a << std::endl;      //prints 1000
              std::cout << N::a << std::endl;   //prints 100 
              std::cout << ::a << std::endl;    //prints 10
          }
      }
    ``` 

* const member must init with constructor initial list

    ```cpp
        class A {
        public:
          A():a(initial_value_of_a()) {}

        private:
          const int a;
          int initial_value_of_a() { return 5; /* some computation here */  };
        };
    ```

* example to use algorithm-merge, the ostream_iterator is very elegant [ref](http://en.cppreference.com/w/cpp/algorithm/merge)

    ```cpp
        int main() {
            // fill the vectors with random numbers
            std::random_device rd;
            std::mt19937 mt(rd());
            std::uniform_int_distribution<> dis(0, 9);
         
            std::vector<int> v1(10), v2(10);
            std::generate(v1.begin(), v1.end(), std::bind(dis, std::ref(mt)));
            std::generate(v2.begin(), v2.end(), std::bind(dis, std::ref(mt)));
         
            // sort
            std::sort(v1.begin(), v1.end());
            std::sort(v2.begin(), v2.end());
         
            // output v1
            std::cout << "v1 : ";
            std::copy(v1.begin(), v1.end(), std::ostream_iterator<int>(std::cout, " "));
            std::cout << '\n';
         
            // output v2
            std::cout << "v2 : ";
            std::copy(v2.begin(), v2.end(), std::ostream_iterator<int>(std::cout, " "));
            std::cout << '\n';
         
            // merge
            std::vector<int> dst;
            std::merge(v1.begin(), v1.end(), v2.begin(), v2.end(), std::back_inserter(dst));
         
            // output
            std::cout << "dst: ";
            std::copy(dst.begin(), dst.end(), std::ostream_iterator<int>(std::cout, " "));
            std::cout << '\n';
        }
    ```

<a name="macrowaytogetfunctionnameinpreprocesstime"></a>
* Macro - varidic macro & token concatenation **We should avoid to use macro because it's  textual level that they operate on and macro won't follow scope rule.** 
        
    ```cpp
        #define MyPrint(...) printf(__VA_ARGS__);    // would expand ... to __VA_ARGS__
        #define eprintf(format, ...) fprintf(stderr, format, ##_VA_ARGS__)  // you don't need to supply at least one argument after format string
        #define XX(n) ob_ ## n    // if n = 4, XX(4) ---> ob_4
        #define COMMAND(NAME) {#NAME, NAME ## _command} // COMMAND(operation) ----> {"operation", operation_command}
    ```

    >macro way to get function name in preprocess time 

    ```cpp
        #include <stdio.h>

        #define QUOTE(name) #name
        #define STR(macro) QUOTE(macro)

        #ifndef TEST_FUN
        #  define TEST_FUN some_func
        #endif

        #define TEST_FUN_NAME STR(TEST_FUN)

        void some_func(void) {
          printf("some_func() called\n");

        }

        void another_func(void) {
          printf("do something else\n");

        }

        int main(void) {
          TEST_FUN();
          printf("TEST_FUN_NAME=%s\n", TEST_FUN_NAME);
          return 0;

        }
    ```

* Get pi const

    ```cpp
        constexpr double pi() { return std::atan(1)*4;  }
    ```

<a name="oopbasiccodeslide"></a>
* OOP basic code slide collection
    >Constructor & destructor in polymorphic

    ```cpp
    #include <bits/stdc++.h>

    using namespace std;

    class Base {
    public :
        int i_;
        Base() {
            i_ = 123;
            cout << "base constructor" << endl;
        
        }
        virtual ~Base() {
            cout << "destruct Base" << endl;
        
        }

    };

    class Derive : public Base {
    public :
        Derive() {
            cout << "derive constructor, i is " << i_ << endl;
        
        }
        ~Derive() {
            cout << "destruct Derive" << endl;
        
        }

    };

    struct Num {
        int v;
        Num(int i) : v(i) { cout << "con" << endl;  }
        Num(Num const & other) : v(other.v) { cout << "copy con" << endl;  }
        Num(Num && other) : v(other.v) {cout << "move con" << endl;}
        Num& operator=(Num const & rhs) {
            cout << "copy assign" << endl;
            v = rhs.v;
            return *this;
        
        }
        Num& operator=(Num && rhs) {
            cout << "move assign" << endl;
            v = move(rhs.v);
            return *this;
        
        }

    };

    Num operator+(Num const & a, Num const & b) {
        cout << "operator +" << endl;
        return Num(a.v + b.v);

    }

    void test01() {
        cout << "===== polymophism construct and destruct" << endl;
        auto pp = new Derive();
        delete pp;
        std::unique_ptr<Base> exp(new Derive());
        if (exp) {
            std::cout << "not nullptr" << std::endl;
        
        }

    }

    void test02() {
        cout << "====== move copy" << endl;
        Num x(1);
        Num y(2);
        Num z(3);
        z = x + y;
        Num z1 = x + y;

    }

    void test03() {
        cout << "====== operator" << endl;
        auto xx = new Num(2);
        xx->~Num();
        cout << "explicitly dest" << endl;

    }

    int main() {
        test01();
        test02();
        test03();

    }
    ===== polymophism construct and destruct
    base constructor
    derive constructor, i is 123
    destruct Derive
    destruct Base
    base constructor
    derive constructor, i is 123
    not nullptr
    destruct Derive
    destruct Base
    ====== move copy
    con
    con
    con
    operator +
    con
    move assign
    operator +
    con
    ====== operator
    con
    explicitly dest
    ```

    > using constructor from direct base 
    [ref](https://stackoverflow.com/questions/9979194/what-is-constructor-inheritance)

    ```cpp
    struct B {
        B(int); // normal constructor 1
        B(string); // normal constructor 2
    };
    struct D : B {
        using B::B; // inherit constructors from B
    };
    ```

    > a un-inheritable class 

    ```cpp
    class A {
    public:
        static A* Construct(int n) {
            A* pa = new A;
            pa->num = n;
            return pa;
        }
        static void Destruct(A *pa) {
            delete pa;
            pd = nullptr;
        }
        int num;
    private:
        A(){}
        ~A(){}
    }
    ```


* Inner & Outer nested class 

    ```cpp
        // nested class is a good design to hinde the implement of doing something
        class outer {
            private :
                class inner {
                    public :
                        func();
                }
                inner in_;
            public :
                funcc() {
                    in_.func();
                }
        }
    ```

* t & gpimplicit<a name="t&gpimplicit"></a>

```cpp
        template<typename T>
        void dosomething(T& w) {
            if (w.size() > 10 && w != someNastyWidget) {
                T temp(w);
                temp.normalize();
                temp.swap(w);
            }
        }
```

* oop explicit<a name="oopexplicit"></a>

```cpp
        class Widget {
            public : 
                Widget();
                virtual ~Widget();
                virtual std::size_t size() const;
                virtual void normalize();
                void swap(Widget& other);
        };

        void dosomething(Widget& w) {
            if (w.size() > 10 && w != someNastyWidget) {
                Widget temp(w);
                temp.normalize();
                temp.swap(w);
            }
        }
```
<a name="SFINAE"></a>
* **SFINAE**, 

    ```cpp
    // SFINAE Expression
    strcut X{}
    struct Y {Y(X){}};
    template <class T>
    auto f(T t1, T t2) -> decltype(t1 + t2); // overload candidate #1
    X f(Y, Y); // overload candidate #2
    // use like this :
    X x1, x2;
    X x3 = f(x1, x2);   // template argument subtitution failure in #1, (fatal error when : expression x1 + x2), so only one overload is in overload set

    // >>>>>>> is_class is implement as
    namespace detail {
        template <class T> char test(int T::*);
        struct two {char c[2];};
        template <class T> two test(...);
    }
    template <class T>
    struct is_class : std::integral_constant<bool, sizeof(detail::test<T>(0)) == 1
                                                    && !std::is_union<T>::value> {};
    // use like this : 
    std::is_class<A>::value

    // >>>>>>> simple traits example 
    template <typename T>
    struct traits {
        typedef unique_ptr<T> value_type;
        //...
    }

    // use like this :
    std::traits<int>::value_type;

    // >>>>>>> single-valued traits
    template<class T>
    struct my_trait {
        typedef T& reference_type;
        static const bool isReference = false;
    }
    template<>
    struct my_trait<T&> {
        typedef T& reference_type;
        static const bool isReference = true;
    }

    // >>>>>>> multi-valued traits
    template<T>
    struct iterator_traits<T*> {
        using difference_type = std::ptrdiff_t;
        using value_type = T;
        using pointer = T*;
        using reference = T&;
        using iterator_category = std::random_access_iterator_tag;
    }

    //  >>>>>>> A policy example
    template<typename T, typename P>
    class my_smart_ptr : protected P {
        public :
            //...
            // assume that p(sp.p) is deep copy
            smart_ptr(smart_ptr const& sp) : p(sp.p), refcount(sp.refcount) {
                P::add_ref(refcount);
            }
            //...
        private :
            T* p;
            int* refcount;
    }
    class multi_thread_refcount_policy {
        protected :
            add_ref(int* refcount) {::InterlockedIncrement(refcount);}
            release(int* refcount) {::InterlockedDecrement(refcount);}
    };
    template<typename T>
    using my_smart_ptr = my_smart_ptr<T, multi_thread_refcount_policy>;

    // >>>>>>>> is void example
    template<typename T>
    struct is_void : public std::false_type {

    }
    template<>
    struct is_void<void> : public std::true_type {

    }
    int main() {
        // for any type T other than void, the 
        // class is derived from false_type
        std::cout << is_void<char>::value << '\n'; 
        // but when T is void, the class is derived
        // from true_type
        std::cout << is_void<void>::value << '\n';

    }

    // >>>>>>>> is pointer example
    template <class T>
    struct is_pointer
    {
      template <class U>
      static char is_ptr(U *);

      template <class X, class Y>
      static char is_ptr(Y X::*);

      template <class U>
      static char is_ptr(U (*)());

      static double is_ptr(...);

      static T t;
      enum { value = sizeof(is_ptr(t)) == sizeof(char)  };

    };

    struct Foo {
      int bar;

    };

    int main(void)
    {
      typedef int * IntPtr;
      typedef int Foo::* FooMemberPtr;
      typedef int (*FuncPtr)();

      printf("%d\n",is_pointer<IntPtr>::value);        // prints 1
      printf("%d\n",is_pointer<FooMemberPtr>::value);  // prints 1
      printf("%d\n",is_pointer<FuncPtr>::value);       // prints 1

    }

    // >>>>>>>> IsClass
    template<typename T>
    class IsClassT {
        private:
            typedef char One;
            typedef struct { char a[2];  } Two;
            template<typename C> static One test(int C::*);
            // Will be chosen if T is anything except a class.
            template<typename C> static Two test(...);
        public:
            enum { Yes = sizeof(IsClassT<T>::test<T>(0)) == 1  };
            enum { No = !Yes  };
    };
    //When IsClassT<int>::Yes is evaluated, 0 cannot be converted to int int::* because int is not a class, so it can't have a member pointer. If SFINAE didn't exist, then you would get a compiler error, something like '0 cannot be converted to member pointer for non-class type int'.
    //Instead, it just uses the ... form which returns Two, and thus evaluates to false, int is not a class type.
    ```

<a name="enable_if"></a>
* enable_if is a technic to use SFINAE  [ref](http://www.fuzihao.org/blog/2016/07/14/C-enable-if%E7%9A%84%E4%BD%BF%E7%94%A8)

    ```cpp
        // >>>>>>>> example of enable_if
        template <bool, class T = void> 
        struct enable_if 
        {};

        template <class T> 
        struct enable_if<true, T> 
        { 
          typedef T type; 
        };

        using namespace std;
        template<bool B, class T = void>
            struct user_enable_if {};
        template<class T>
        struct user_enable_if<true, T> { typedef T type;  };
        struct A{};
        template<typename T>
        struct Traits{
            static const bool is_basic = true;

        };
        template<>
        struct Traits<A>{
            static const bool is_basic = false;

        };
        template<typename T>
        void f(T a, typename user_enable_if<Traits<T>::is_basic, void>::type* dump= 0){
            cout<<"a basic type"<<endl;

        }
        template<typename T>
        void f(T a, typename user_enable_if<!Traits<T>::is_basic, void>::type* dump= 0){
            cout<<"a class type"<<endl;

        }
        int main(){
            A a;
            f(1);
            f(a);

        }
    ```

        
* Found something awesome,[ref](https://gist.github.com/ofan/721464), an implement of lisp in cpp!!! **TODO** Read it.

* when have multiple processes appending data to same file, for race condition, we need code like this:

```cpp
        if (lseek(fd, 0, SEEK_END) == -1) {
            perror("lseek");
        }
        if (write(fd, buf, len) != len) {
            fatal("Partial/failed write");
        }
```

* Policy-base class design is a variant of strategy pattern, and shared_ptr is implemented following this programming paradiam [ref](http://stackoverflow.com/questions/9200664/how-is-the-stdtr1shared-ptr-implemented)

* Private inheritance [ref](http://stackoverflow.com/questions/656224/when-should-i-use-c-private-inheritance)

* std::function & std::bind :

```cpp
    class Penguin {
        public :
            void run();
            void swim();
    };

    class Sparrow {
        public :
            void fly();
            void run();
    };

    using FlyCallback = std::function<void()>;
    using RunCallback = std::function<void()>;
    using SwimCallback = std::function<void()>;

    class Foor {
        public :
            Foo(FlyCallback flycb, RunCallback runcb) : flycb_(flycb), runcb_(runcb) { }
        private :
            FlyCallback flycb_;
            RunCallback runcb_;
    }

    int main() {
        Sparrow s;
        Penguin p;
        Foo foo(bind(&Sparrow::fly, &s), bind(&Penguin::run, &p));
    }
```

* template alias :

```cpp
        template <typename T>
        using func_t = void (*)(T, T);
        func_t<int> xx_2;
```

* measure time : [ref](https://stackoverflow.com/questions/2808398/easily-measure-elapsed-time)

```cpp
        #include <iostream>
        #include <chrono>
        template<typename TimeT = std::chrono::milliseconds>
        struct measure
        {
            template<typename F, typename ...Args>
            static typename TimeT::rep execution(F&& func, Args&&... args)
            {
                auto start = std::chrono::steady_clock::now();
                std::forward<decltype(func)>(func)(std::forward<Args>(args)...);
                auto duration = std::chrono::duration_cast< TimeT> 
                                    (std::chrono::steady_clock::now() - start);
                return duration.count();
            
            }

        };

        int main() {
            std::cout << measure<>::execution(functor(dummy)) << std::endl;

        }
```

* two level pointer with linked list delete : [ref](http://coolshell.cn/articles/8990.html)

```cpp
        void remove_if(node ** head, remove_fn rm)
        {
            for (node** curr = head; *curr; )
            {
                node * entry = *curr;
                if (rm(entry))
                {
                    *curr = entry->next;
                    free(entry);
                
                }
                else
                    curr = &entry->next;
            
            }

        }
```

<a name="convertsourcetomemorystringby"></a>
* convert source code token to memory string by preprocesser replace: [another](#macrowaytogetfunctionnameinpreprocesstime) [ref](https://stackoverflow.com/questions/240353/convert-a-preprocessor-token-to-a-string)

```cpp
        #define VERSION_MAJOR 4
        #define VERSION_MINOR 47

        #define STRINGIZE2(s) #s
        #define STRINGIZE(s) STRINGIZE2(s)
        #define VERSION_STRING "v" STRINGIZE(VERSION_MAJOR) \
        "." STRINGIZE(VERSION_MINOR)

        #include <stdio.h>
        int main() {
            printf ("%s\n", VERSION_STRING);
            return 0;

        }
```

* what happened when lvalue is asigned by a rvalue reference:

```cpp
        using namespace std;
        void func(string&& ss) {
            //string sss = ss;       // print ?? because std::string swap the content
            // do no thing                  // print ??fuck
        }
        int main() {
            string fuck = "fuck";
            func(std::move(fuck));
            cout << "??" <<fuck << endl;
        }
```

> this was caused by compiler, when assigned by a rvalue reference, compiler would find the temporary pos of that rvalue, then assign it with move asignment constructor, which would usually swap these two. If no swap happend, then rvalue reference keep its value.

* getter in cpp with functional programming :

```cpp
        struct Lambda {
            int i = 12;
            int j = 33;
            std::function<int(string)> get_getter() {
                return [this](string name) {
                    if (name == "i") {
                        return i;
                    } else if (name == "j") {
                        return j;
                    } else {
                        return 44;
                    }
                };
            }
        };
        int main() {
           Lambda aa;
            auto getter = aa.get_getter();
            cout << getter("i") << endl;

        }
```

* a good practice using parameter pack [ref](https://stackoverflow.com/questions/38749951/how-to-create-custom-integer-sequence-in-c)

```cpp
        #include <iostream>
        #include <tuple>
        #include <utility>

        template <typename ... Types>
        void foo(const Types & ... values) {
            using swallow = bool[];
            (void)swallow{ (std::cout << values << std::endl,false)...  };
        }

        template <std::size_t N, bool = (N%2==0)>
        struct pick {
            template<typename... Types>
            static std::size_t get(const std::tuple<Types...>&) { return N/2;  }
        };

        template <std::size_t N>
        struct pick<N,false> {
            template<typename... Types>
            static auto get(const std::tuple<Types...>& t) { return std::get<N/2>(t);  }
        };

        template <std::size_t... Indices, typename ... Types>
        void bar2(const std::index_sequence<Indices...>, const Types & ... values) {
            auto x = std::tie(values...);
            foo(pick<Indices>::get(x)...);
        }

        template <typename ... Types>
        void bar(const Types & ... values) {
            bar2(std::index_sequence_for<Types...,Types...>(), values...);  // () means instance a ob
        }

        int main() {
            bar( "Hallo", 42, 1.23  );

        }
        // out put:
        //0
        //Hallo
        //1
        //42
        //2
        //1.23

```

* prefix increment and posfix increment and iterator implement

```cpp
T& operater++();     // prefix increment
T operator++(int);      // postfix increment
```

iterator implement, not simple at all 
    [boost](http://www.boost.org/doc/libs/1_47_0/libs/iterator/doc/iterator_facade.html#implementing-the-core-operations)

* implement of forward [ref](https://stackoverflow.com/questions/3582001/advantages-of-using-forward)

```cpp
template<typename T>
T&& forward(T&& param) {
    if (is_lvalue_reference<T>::value) {
        return param;
    } else {
        return move(param);
    }
}
```

* propagate exception with threads [ref](https://stackoverflow.com/questions/233127/how-can-i-propagate-exceptions-between-threads)

```cpp
#include<iostream>
#include<thread>
#include<exception>
#include<stdexcept>

static std::exception_ptr teptr = nullptr;

void f() {
    try {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        throw std::runtime_error("To be passed between threads");
    } catch(...) {
        teptr = std::current_exception();
    }
}

int main(int argc, char **argv) {
    std::thread mythread(f);
    mythread.join();
    if (teptr) {
        try{
            std::rethrow_exception(teptr);
        } catch(const std::exception &ex) {
            std::cerr << "Thread exited with exception: " << ex.what() << "\n";
        }
    }
    return 0;
}
```

* running method of class in thread [ref](https://stackoverflow.com/questions/10998780/stdthread-calling-method-of-class)

    ```cpp
    #include <future>

    void Test::runMultiThread() {
         auto f1 = std::async(&Test::calculate, this,  0, 10);
         auto f2 = std::async(&Test::calculate, this, 11, 20);

         auto res1 = f1.get();
         auto res2 = f2.get();

    }
    ```
<a name="lvaluervalue"></a>
* lvalue rvalue xvalue glvalue prvalue universal reference 
```cpp
        int i;
        int* p = &i;
        int& f();
        int&& g();

        int h();

        h() // prvalue
        g() // glvalue (xvalue)
        f() // glvalue (lvalue)
        i   // glvalue (lvalue)
        *p  // glvalue (lvalue)

        std::move(i)  // glvalue (xvalue)
```

* given two date, calculate the diff

```cpp
int isleapyear(int year)  //是否是闰年 {
    return ((year % 4 == 0 && year % 100 != 0)|| year % 400 == 0);

}

int sum(int year, int month, int day) {
    int mon[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int sum = (year - 1) * 365;  //自公元1年来的天数
    int i;
    sum += (year - 1) / 4 + 1;  //能被4整除的都加上
    sum -= (year - 1) / 100 + 1;  //其中被100整除的不是闰年
    sum += (year - 1) / 400 + 1;  //实际上能被400整除的即为闰年
    for(i = 0; i < month - 1; ++i)  //将本年的剩下的整月加上
       sum += mon[i];
    if(isleapyear(year) == 1 && month > 2)  //本年是否闰2月
       ++sum;
    sum += day;  //本月的日子加上
    return sum;
}


int main() {
    printf("%d\n", sum(2013, 11, 1) - sum(2013, 9, 30));
    return 0;
}
```

* 互联网编程题-小米笔试题 ==  最前匹配

    ```cpp
    #include <bits/stdc++.h>

    using namespace std;
    /*
     *
     *  给你一个route, 和 一个处理函数, 最前置匹配
     */

    struct Node {
        vector<Node*> children;
        int v_ = - 1;
        string p_;
        Node(int i, string p) : v_(i), p_(p) {}

    };

    Node* insert(Node* root, string& str, int n) {
        assert(!str.empty());
        stringstream ss(str);
        string p;
        ss >> p;
        str = str.substr(p.size() + 1);
        int k = str.empty() ? n : 0;
        Node* newn = new Node(k, p);
        cout  << "insert " << p << k << endl;
        root->children.push_back(newn);
        return newn;

    }

    Node* search(Node* root, string str) {
        if (str.empty()) { return root ; }
        stringstream ss(str);
        string p;
        ss >> p;
        string newstr = str.substr(p.size() + 1);
        cout << "search " <<  p << " remain " << newstr << endl;
        Node* dst = nullptr;
        for (auto s : root->children) {
            if (p == s->p_) {
                dst = s;
            
            }
        
        }
        if (dst == nullptr) {
            return root;
        
        } else {
            return search(dst, newstr);
        
        }

    }

    void test() {
        string oneline;
        Node* root = new Node(-1, "");
        vector<int> result;
        int flag = 0;
        vector<string> test = {
                "/a 1",
                "/a/b 2",
                "/a/b/c/d/e/f/g/h/i 3",
                "/a/bcde 4",
                "-",
                "/a",
                "/a/b",
                "/a/b/c/d",
                "/a/b/c/d/e/f/g/h/i",
                "/a/bcde",
                "/a/bcdefghi",
                "/b",
                "",
        
        };
        for (auto v: test) {
            oneline = v;
            if (oneline.empty()) { break; }
            stringstream ss(oneline);
            if (oneline == "-") {
                flag = 1;
                continue;
            
            }
            if (flag == 0) {
                string str;
                int n;
                ss >> str >> n;
                Node* cur = root;
                replace(str.begin(), str.end(), '/', ' ');
                while (!str.empty()) {
                    cur = search(cur, str);
                    cur = insert(cur, str, n);
                
                }
            
            } else {
                string str;
                ss >> str ;
                cout << "fuck " << str << endl;
                replace(str.begin(), str.end(), '/', ' ');
                auto target = search(root, str);
                if (target == nullptr) {
                    result.push_back(0);
                
                } else {
                    result.push_back(target->v_);
                    cout << "get " << target->p_  << endl;
                
                }
            
            }
        
        }

        for (auto r : result) {
            cout << r << endl;
        
        }


    }

    int doit() {
        string oneline;
        Node* root = new Node(0, "");
        vector<int> result;
        int flag = 0;

        while (true) {
            getline(cin, oneline);
            if (oneline.empty()) { break; }
            stringstream ss(oneline);
            if (oneline == "-") {
                flag = 1;
                continue;
            
            }
            if (flag == 0) {
                string str;
                int n;
                ss >> str >> n;
                replace(str.begin(), str.end(), '/', ' ');
                while (!str.empty()) {
                    auto target = search(root, str);
                    insert(target, str, n);
                
                }
            
            } else {
                string str;
                ss >> str ;
                replace(str.begin(), str.end(), '/', ' ');
                auto target = search(root, str);
                cout << target->p_ << endl;
                result.push_back(target->v_);
            
            }
        
        }

        for (auto r : result) {
            cout << r << endl;
        
        }

    }

    int main() {
        test();
        //doit();

    }
    ```

* 互联网编程题 实现一个String [陈硕](https://coolshell.cn/articles/10478.html), 如下是我的实现 [take a look at short string optimization](#fucksso)

    ```cpp
    #include <bits/stdc++.h>

    using namespace std;

    class MString {
      public :
          MString(const char * data) : d_(new char[strlen(data) + 1]) {
        strcpy(d_, data);
      
          }
          MString() : d_(new char[1]) {
        d_[0] = '\0';  
      
          }
          MString(MString const & other) : d_(new char[other.size() + 1]) {
        strcpy(d_, other.c_str());
      
          }
          ~MString() {
        delete [] d_;
      
          }
          MString& operator=(MString const & other) {
        MString nstr(other);
        swap(nstr);
        return *this;
      
          }
          MString& operator=(MString&& other) {
        swap(other);
        return *this;
      
          }
          void swap(MString&& other) {
        ::swap(d_, other.d_);
      
          }
          void swap(MString& other) {
        ::swap(d_, other.d_);
      
          }
          const char * c_str() const {
        return d_;
      
          }
          size_t size() const {
        return strlen(d_);
      
          }
      
      private :
      char* d_;

    };

    int main() {
        MString s = "ada";
        MString s0 = s;
        MString s1(s0);
        MString s2("ddasd");

    }
    ```

* using hash for pair<>

    ```cpp
    struct pairhash {
    public:
      template <typename T, typename U>
      std::size_t operator()(const std::pair<T, U> &x) const {
        return std::hash<T>()(x.first) ^ std::hash<U>()(x.second);
      }
    };

    class abc {
      std::unordered_map<std::pair<int,int>, int, pairhash> rules;
    };
    ```

<a name="compileroptimization"></a>
* compiler optimization 

    > RVO & NRVO

    ```cpp
    class BigObject {

    };

    BigObject foo() {
        return BigObject(); // RVO

    }

    BigObject bar() {
       BigObject localObj;
       return localObj; // NRVO

    }

    ```

    > constant folding

    ```cpp
    const int a = 1;
    int* p = &a;
    *p = 2;
    cout << p << a << endl; // 1, 2 constant folding
    ```
