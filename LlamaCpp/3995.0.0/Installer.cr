class Target < ISM::Software

    def prepare
        super

        #Add a phase to patch when building in a virtual machine. Need to remove -march=native from the Makefile and set -march=x86-64 (no avx instructions)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end

    def prepareInstallation
        super

        copyFile("#{buildDirectoryPath}llama-*","#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/")
    end

end
