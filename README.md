# Run Ghidra in a Container

> I use rootless docker so no attempt is made to run as non-root

## Usage

```shell
docker build -t ghidra .
./run.sh . #maps current directory to /root/target in the container
```
