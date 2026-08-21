#!/bin/bash
python3 -c "
import base64,sys
decoded = base64.b64decode(sys.argv[1])
print(''.join(chr(byte ^ 0x5F) for byte in decoded))" "${1#\{xor\}}"
