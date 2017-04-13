################################################################################
#
# ragel
#
################################################################################

RAGEL_VERSION = ragel-7.0.0.9
RAGEL_SITE = git://git.colm.net/ragel.git
RAGEL_AUTORECONF = YES
RAGEL_DEPENDENCIES = colm

$(eval $(host-autotools-package))
