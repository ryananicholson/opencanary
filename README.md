# opencanary

Custom-configured version of OpenCanary in a handy Docker image format. Featured in SANS SEC488 - Cloud Security Essentials.

## Usage

```bash
docker run -dit --restart always --name opencanary -v /var/tmp:/var/tmp -p 8000:80 ryananicholson/opencanary:latest
```
