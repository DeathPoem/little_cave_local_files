# CGO study journal

### templates

color template

<font color="green" size="6">
<a name="fuccccc"></a>
fucckkkkk
</font>

# Table of contents

* go 调用 C 的方法

    * 在go file里写注释，注意include和对应编译选项 [ref](https://github.com/draffensperger/go-interlang/tree/master/go_to_c)

* C 调用 go 的方法

    * 用go build 产生.a库 和 头文件 [ref](http://blog.ralch.com/tutorial/golang-sharing-libraries/) [ref](https://stackoverflow.com/questions/32215509/using-go-code-in-an-existing-c-project) [ref](https://github.com/draffensperger/go-interlang/tree/master/c_to_go/static_go_lib) [ref](https://github.com/draffensperger/go-interlang/tree/master/c_to_go/cxx_to_go_dyn_lib)

    * 用gccgo 生成.o 文件 [ref](https://github.com/draffensperger/go-interlang/tree/master/c_to_go/gccgo)

* zbs-vnet的方法

    adoptLayer.go used C-interface(by import "C" and comment) , and export Go-interface(by comment)

    adopt.h declare exported C-interface and imported Go-interface

    cside.c 'include' adopt.h and use imported Go-interface & supply exported C-interface

    then just let gcc 'magicaly automaticaly' compile it for you.

* how Cgo build-in funcs work?

    ```
    func C.CString(string) *C.char // https://golang.org/cmd/cgo/
    ```

    It is a interface of CGO programming, how it works? how can I generate source code of it? ~~remenber I found it once, but without record.~~
    ```
    go tool cgo goganeshawraper.go
    cd ./_obj && grep CBytes ./*
    ```
    [ref](https://tiancaiamao.gitbooks.io/go-internals/content/zh/09.1.html)