# opencanary

Custom-configured version of OpenCanary in a handy Docker image format. Featured in SANS SEC488 - Cloud Security Essentials.

## Usage

```bash
docker run -dit --restart always --name opencanary -v /var/tmp:/var/tmp -p 80:80 ryananicholson/opencanary:latest
```

## Testing

Launch attach with cURL:

```bash
curl -XPOST http://127.0.0.1/index.html -d 'username=testuser&password=testpass&btnLogin=Login'
```

Review results:

```bash
tail /var/tmp/opencanary.log
```
