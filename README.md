## Nginx Cache

Simple caching proxy using Ngnix. Configure with these variables:

 * **BACKEND** (required) Value for [proxy_pass][proxy_pass] directive.
 * **INACTIVE** (optional) Value for [proxy_cache_path][proxy_cache_path] `inactive` parameter. This image sets it by default to `15m` (15 minutes).
 * **MAX_SIZE** (optional) Value for [proxy_cache_path][proxy_cache_path] `max_size` pareameter. This image sets it by default to `20m` (20 megabytes).


[proxy_pass]: http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass
[proxy_cache_path]: http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_cache_path


### Logging

The `nginx:stable` image this is based on redirects its logs to the standard outputs:

```
# ls -l /var/log/nginx/
total 0
lrwxrwxrwx 1 root root 11 Jan 22 23:28 access.log -> /dev/stdout
lrwxrwxrwx 1 root root 11 Jan 22 23:28 error.log -> /dev/stderr
```

The log format was changed to include HIT/MISS info.
