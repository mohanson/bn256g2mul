set -ex

cd /src/ckb-vm-pprof
cargo build --release
./target/release/ckb-vm-pprof --bin /src/bn256g2mul/build/bn256g2 --arg 0x2dddefa19 --arg 0x1800deef121f1e76426a00665e5c4479674322d4f75edadd46debd5cd992f6ed --arg 0x198e9393920d483a7260bfb731fb5d25f1aa493335a9e71297e485b7aef312c2 --arg 0x12c85ea5db8c6deb4aab71808dcb408fe3d1e7690c43d37b4ce6cc0166fa7daa --arg 0x90689d0585ff075ec9e99ad690c3395bc4b313370b38ef355acdadcd122975b --arg 0x23997083c2c4409869ee3546806a544c8c16bc46cc88598c4e1c853eb81d45b0 --arg 0x1142585a23028cbe57783f890d1a2f6837049fce43c9b3b5e8e14c40a43c617a --arg 0x215a23c8a96e1ca11d52cf6e2d6ada4ed01ee7e09b06dbc7f3315e7e6e73b919 --arg 0xedac9f3a977530e28d4a385e614bcb7a8f9c3c3cb65707c1b90b5ea86174512 > flamegraph.txt
cat flamegraph.txt | py scripts/folder.py | inferno-flamegraph > flamegraph.svg
