Buy bitcoins
------------

On the board:

  bitcoin-cli getnewaddress # -> <address>

Pay with bitcoins, method 1
---------------------------

Principles: import the address and its private key on the host connected to the
internet, then use it.

On the board:

  bitcoin-cli dumpprivkey <address> # -> <privkey>

On the host:

  bitcoin-cli importprivkey <privkey>

Pay with bitcoins, method 2
---------------------------

Principles: generate and sign a transaction on the board, then send it with the
host connected to the internet.

Note: beware remaining coins.

TBD

Reference
---------

  wipefs -a <dev>

  mdadm --create /dev/md42 --level=1 --raid-devices=4 <dev> <dev> ...
  mdadm --manage --fail /dev/md42 <dev>
  mdadm --grow --bitmap=internal /dev/md42
  mdadm --manage --remove /dev/md42 <dev>
  mdadm --manage --add /dev/md42 <dev>

  bitcoin-cli createwallet ""
  bitcoin-cli listwallets
  bitcoin-cli listlabels
  bitcoin-cli getaddressesbylabel ""
  bitcoin-cli getnewaddress
  bitcoin-cli setlabel <address> "label"
  bitcoin-cli dumpprivkey <address>
