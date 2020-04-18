# XonoticDocker
DockerFile to create xonotic server

## Xonotic dedicated server

Build:
```bash
docker build -t opvolger/xonotic .
```

Run:
```bash
docker run -i -p 26000:26000/udp -p 26000:26000/tcp --name xonotic opvolger/xonotic
```
