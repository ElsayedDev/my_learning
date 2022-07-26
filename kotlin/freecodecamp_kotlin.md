# Kotlin for android

## class 20/07/2022

class is little different from dart

1 class could be initial without constructor
  
   ```kotlin
   class Person

   ```

this work and ok to called in main function

2 class could be initial with many ways constructors

   ```kotlin
    //// 1 - 
    class Person(name: String)

    /// 2 - 
    class Person(name: String) {

    }

    /// 3 -
    class Person(name: String)
    {
        init {
            /// thing
        }
    }

    /// 4 -
    class Person constructor(ahmed:String)

    /// 5 -
    class Person (){
        constructor(name: String)
        {
            /// thing
        }
    } 

   
   ```

3 class has _Public_ , _Private_ , _Internal_
    also **Functions**

4 class has _Getter_ , _Setter_

``` kotlin
 private  var nickName:String?  =null
        set(value) {
         field = value
         println("$value")
        }
        get(){

            return field
        }
```

### Today code

``` kotlin
     class Person(val _firstName:String = "Ahmed" ,val _lastName:String = "Elsayed"){

  private  var nickName:String?  =null
        set(value) {
         field = value
         println("$value")
        }
        get(){

            return field
        }


    fun printInfo(){
        val _nickName = nickName ?: "thing"
        println("$_firstName ($_nickName) $_lastName")
    }


}



```

### 26/07/2022

*random

```kotlin
randomNumber = (1..sides).random()
```
