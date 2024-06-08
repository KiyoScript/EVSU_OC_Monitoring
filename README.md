## Instruction 📝
### How to run this app to your Local?

1. Install Ruby:

    - Download the Ruby+Devkit installer from the RubyInstaller website (https://rubyinstaller.org/downloads/).
    - Run the installer and follow the instructions to install Ruby on your system.
    - Make sure to select the option to "Add Ruby executables to your PATH" during the installation.

2. Install Node.js:
    - Download the Node.js installer from the official Node.js website (https://nodejs.org/en/download/).
    - Run the installer and follow the instructions to install Node.js on your system.

3. Install the Rails gem:
    - Open a command prompt or terminal window.
    - Run the following command to install the Rails gem:
    - Run: `gem install rails`


4. Install database dependencies:
    - Download and install PostgreSQL from the official website (https://www.postgresql.org/download/). Since this app used **Postgresql**


5. Clone this app (optional):
    - Run the following command.
    - Run: `https://github.com/KiyoScript/EVSU_OC_Monitoring`
    - Navigate the EVSU_OC_Monitoring directory or cd pathname/EVSU_OC_Monitoring if you're using WSL.
    - Run: `rails db:create && rails db:seed && bundle install && rails db:migrate`

5.1 Only follow this step if when you have already the file of the system.
    - Navigate the EVSU_OC_Monitoring directory or cd pathname/EVSU_OC_Monitoring if you're using WSL.
    - Run: `rails db:create && rails db:seed && bundle install && rails db:migrate`

6. To run the App
    - Run: `rails s` or `rails s -p 5000`

7. System URL
    - https://evsu-oc-monitoring.fly.dev
