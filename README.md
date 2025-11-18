## Instruction 📝

### Demonstration
<img width="1429" height="850" alt="image" src="https://github.com/user-attachments/assets/6adf8e9e-0342-464c-9574-78b57cc476de" />
<img width="1435" height="853" alt="image" src="https://github.com/user-attachments/assets/1f640c8b-d6c6-4d02-908f-49cdd0fedb00" />
<img width="1435" height="851" alt="image" src="https://github.com/user-attachments/assets/1f340cb7-fa03-4e07-9139-8a4a0737eeb1" />
<img width="1433" height="851" alt="image" src="https://github.com/user-attachments/assets/053f0897-1536-4da8-a0e5-7ec84fa1ed9c" />
<img width="1435" height="854" alt="image" src="https://github.com/user-attachments/assets/10b87587-b50d-4832-9efd-5ec6711ad8d5" />
<img width="1428" height="848" alt="image" src="https://github.com/user-attachments/assets/10992acd-c2fe-4b65-8d73-8e040d9876ef" />


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
