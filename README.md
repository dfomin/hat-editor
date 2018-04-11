## Pigowl.Alias editor

This is the application aims to help with Alias content analyzing.


## Dependencies

* To generate VIPER modules it's made use of Generamba: https://github.com/rambler-digital-solutions/Generamba.
  There is the `submodule` template that consists of all module necessary types and protocols, and module tests for presenter, interactor and configurator.
  Firstly, you need to install generamba on your computer via:
  ```
    sudo gem install generamba
  ```
  To generate module you need to navigate to the folder contains the project file and execute the following command:
  ```
    generamba gen [MODULE_NAME] submodule
  ```

