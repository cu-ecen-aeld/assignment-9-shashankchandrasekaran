##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = 8f8785815031118bcf5dcc95ca4cb9d8b61ad778
# Note: Be sure to reference the ssh repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
# Add github URL for Assignment 7
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-shashankchandrasekaran.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# / because its a folder
LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/

#define AESD_ASSIGNMENTS_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
#endef

# TODO add module and scull load and unload utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

# key line which builds the modules
$(eval $(kernel-module))
$(eval $(generic-package))
