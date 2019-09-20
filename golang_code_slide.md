# This file

## Preface

- [This file](#this-file)
  - [Preface](#preface)
  - [Go-basic](#go-basic)
  - [Go-advance](#go-advance)
  - [Go-internal](#go-internal)
  - [Code slide](#code-slide)

## Go-basic

## Go-advance

## Go-internal

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