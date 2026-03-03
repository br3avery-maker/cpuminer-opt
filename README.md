LuckyPepe (LPEPE) CPU Miner
==========================

**Website:** https://luckypepe.org

**Algorithm:** YescryptR32

**Modification:** Added mandatory 7% dev fund output in coinbase transactions for solo mining (GBT mode), as required by LPEPE consensus rules. Removing or modifying the dev fund code will result in blocks being rejected by the network.

Usage
-----

Windows:

    cpuminer.exe -a yescryptr32 -o stratum+tcp://POOL_ADDRESS:PORT -u YOUR_WALLET_ADDRESS.WORKER_NAME -p x -t 4

Linux:

    ./cpuminer -a yescryptr32 -o stratum+tcp://POOL_ADDRESS:PORT -u YOUR_WALLET_ADDRESS.WORKER_NAME -p x -t 4

Build: See INSTALL_LINUX or INSTALL_WINDOWS for compile instructions.

License: GPLv2 — fork of [cpuminer-opt](https://github.com/JayDDee/cpuminer-opt) by JayDDee.
