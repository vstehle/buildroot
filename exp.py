#!/usr/bin/env python3

import pexpect
import sys

child = pexpect.spawn('./go', encoding='utf-8', timeout=7)
child.logfile = sys.stdout

child.expect('NOTICE:  Booting Trusted Firmware')
child.expect('NOTICE:  BL31: v2.7')
child.expect('I/TC: OP-TEE version: 20')
child.expect('U-Boot 20')

child.expect('Hit any key to stop autoboot:')
child.sendline('')

child.expect('=>')
child.sendline('printenv -e')

child.expect('tee_rpmb_verify_key_sync_counter')
child.expect('Reading counter')
child.expect('SetupMode:')
child.expect('SecureBoot:')
child.expect('OsIndicationsSupported:')
child.expect('=>')

# child.expect('GNU GRUB  version 2.06')

# child.expect('The highlighted entry will be executed automatically in')
# child.sendline('')

# child.expect('EFI stub: Booting Linux Kernel...')
# child.expect('Linux version 6.0.6')
# child.expect('Freeing unused kernel memory:')
# child.expect('Welcome to Buildroot')

# child.expect('login:')
# child.sendline('root')

# child.expect('#')
# child.sendline('optee_example_hello_world')

# child.expect('Loading TS 8aaaf200-2450-11e4-abe2-0002a5d5c51b')
# child.expect('TA_CreateEntryPoint')
# child.expect('TA_OpenSessionEntryPoint')
# child.expect('Hello World!')
# child.expect('Goodbye!')
# child.expect('TA_DestroyEntryPoint')
# child.expect('#')
