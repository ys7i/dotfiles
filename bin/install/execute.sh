#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/symbolic_link.sh"
link_to_homedir

source "$(dirname "${BASH_SOURCE[0]}")/libraries.sh"
install_libraries