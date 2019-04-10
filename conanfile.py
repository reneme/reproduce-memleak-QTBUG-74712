from conans import ConanFile
from conans.tools import os_info

class TestApp(ConanFile):
    name = 'TestApp'
    description = 'a spike to reproduce a Qt bug'
    generators = 'cmake'
    settings = 'os', 'compiler', 'build_type', 'arch'

    def requirements(self):
        self.requires("qt/5.11.3@bincrafters/stable")

    def configure(self):
        self.options["qt"].add("commercial=True")

        self.options["qt"].add("qtbase=True")
        self.options["qt"].add("qtsvg=True")
        self.options["qt"].add("qtdeclarative=True")
        self.options["qt"].add("qttranslations=True")
        self.options["qt"].add("qtgraphicaleffects=True")
        self.options["qt"].add("qtquickcontrols=True")
        self.options["qt"].add("qtquickcontrols2=True")
        self.options["qt"].add("qtmacextras=True")

    def imports(self):
        self.copy("*.dll", "bin", "bin")
