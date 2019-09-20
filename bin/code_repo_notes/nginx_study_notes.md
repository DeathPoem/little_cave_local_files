
<font color="green" size="6">
<a name="fucknginx"></a>
### Nginx 
</font>

* Architecture 

    * master --> worker, master listenes and fork then don't listen, worker race to accept and handle this socket, sync by a inter-process mutex.

* data structure

    * ngx_buf_t, has a read-write bit, when someone has ref on it, you need copy one write when you want modify it.

* Connection 

    * using **lingering_close** to setsocketopt with **SO_LINGER** option, reduce the time waste on **TIME_WAIT**

* handle http request

    * a typic http response process :

        1. http parse, a state machine based on http standard.

        2. based on http req, choose a content handle operation to generate response content due to the content of request, in nginx, it's called **'ngx_http_phase_handler_t'**. Or choose upstream (proxy) to proxy to other server.

        3. choose a chain of content filter (modify) operation to modify response content. it's very similar to the **'middle_ware function'** in nodejs.
