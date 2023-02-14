# ziging

## Installation

``` wget https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz -P /workspace/```

``` tar -xvf /workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz -C /workspace/```

```sudo cp /workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a/zig /usr/local/bin/zig```

``` rm -rf /workspace/zig-linux-x86_64-0.11.0-dev.1580+a5b34a61a.tar.xz```

```wget https://github.com/nektro/zigmod/releases/download/r84/zigmod-x86_64-linux -O zigmod && chmod +x zigmod && sudo mv zigmod /usr/local/bin/ ```

## Usage
``` zigmod fetch```

```zig run src/main.zig```
