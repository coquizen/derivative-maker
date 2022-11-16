#!/bin/bash

main() {
  prepare_environment
  install_source
  run_tests
}

prepare_environment() {
  echo changeme | sudo -S apt-get update 
  sudo apt-get install git python3-behave python3-pip python3-pyatspi -yq
  pip3 install dogtail
  gsettings set org.gnome.desktop.interface toolkit-accessibility true
}

install_source() {
  cd /home/user/
  find -type d -name "whonix_automated_test_suite" -delete
  git clone https://github.com/Mycobee/whonix_automated_test_suite.git
}

run_tests() {
  cd whonix_automated_test_suite
  DISPAY=0:0 behave ./features
}

main
