# This file

## Preface

- [This file](#this-file)
  - [Preface](#preface)
  - [Go-basic](#go-basic)
  - [Go-advance](#go-advance)
    - [Debug tool](#debug-tool)
  - [Go-internal](#go-internal)
    - [Go runtime](#go-runtime)
  - [Code slide](#code-slide)
  - [Unorder topic](#unorder-topic)

## Go-basic

## Go-advance

* hook go func

[ref](https://bou.ke/blog/monkey-patching-in-go/)

### Debug tool

* go tool trace

* pprof

* dlv

* race detector

[ref](https://golang.org/doc/articles/race_detector.html)

## Go-internal

### Go runtime

## Code slide

* redirect golang panic file [quote from](#https://github.com/golang/go/issues/325)

    ```go
        dupPanic2File = func(str string) error {
            logFile, err := os.OpenFile(str, os.O_WRONLY|os.O_CREATE|os.O_SYNC, 0755)
            if err != nil {
                return err
            }
            syscall.Dup2(int(logFile.Fd()), 2)
        }
    ```

* unsafe slice header [quote from](#https://github.com/go-bindata/go-bindata)

```
var _myfile = "\x89\x50\x4e\x47\x0d\x0a\x1a"

func myfile() []byte {
    var empty [0]byte
    sx := (*reflect.StringHeader)(unsafe.Pointer(&_myfile))
    b := empty[:]
    bx := (*reflect.SliceHeader)(unsafe.Pointer(&b))
    bx.Data = sx.Data
    bx.Len = len(_myfile)
    bx.Cap = bx.Len
    return b
}
```

## Unorder topic

* performance penalty about GC instead of 'stop world'

When people talk about GC pauses in Go applications they typically talk only about the ‘stop the world’ pause which occurs at the end of the mark phase. Our tests agree that this pause is very short, but we also experience clear and repeated pauses which are much larger than this during the mark phase.

[ref](http://big-elephants.com/2018-09/unexpected-gc-pauses/)

* pointer receiver vs value receiver

A value receiver can reduce the amount of garbage that can be generated; if a value is passed to a value method, an on-stack copy can be used instead of allocating on the heap.
Finally, when in doubt, use a pointer receiver.

[ref](https://stackoverflow.com/questions/27775376/value-receiver-vs-pointer-receiver)