################################################################################
#
# hyperscan
#
################################################################################

HYPERSCAN_VERSION = v4.4.1
HYPERSCAN_SITE = https://github.com/01org/hyperscan.git
HYPERSCAN_SITE_METHOD = git
HYPERSCAN_DEPENDENCIES = boost host-ragel sqlite libpcap

$(eval $(cmake-package))
