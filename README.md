# XonoticDocker
DockerFile to create xonotic server

## Xonotic dedicated server

Build:
```bash
docker build -t opvolger/xonotic .
```

Run:
```bash
docker run -p 26000:26000/udp opvolger/xonotic --name xonotic
```
