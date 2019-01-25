## Nginx Cache

Simple caching proxy for Nabu. Configure with these variables:

 * **BACKEND** (required) Value for [proxy_pass][proxy_pass] directive.
 * **HOST_HEADER** (optional) Value for `Host` header to be sent to the backend.
   Defaults to the hostname in the `BACKEND` variable.
 * **INACTIVE** (optional) Value for [proxy_cache_path][proxy_cache_path] `inactive` parameter. This image sets it by default to `5m` (5 minutes).
 * **MAX_SIZE** (optional) Value for [proxy_cache_path][proxy_cache_path] `max_size` pareameter. This image sets it by default to `20m` (20 megabytes).


[proxy_pass]: http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass
[proxy_cache_path]: http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_cache_path
