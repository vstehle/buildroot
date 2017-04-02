################################################################################
#
# odp - OpenDataPlane
#
################################################################################

ODP_VERSION = v1.14.0.0
ODP_SITE = https://git.linaro.org/lng/odp.git
ODP_SITE_METHOD = git
ODP_AUTORECONF = YES
ODP_DEPENDENCIES = openssl

$(eval $(autotools-package))
