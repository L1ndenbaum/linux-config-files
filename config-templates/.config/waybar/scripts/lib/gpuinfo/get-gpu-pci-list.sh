#!/bin/bash

get_gpu_pci_list() {
    ls -d /sys/class/drm/card[0-9]/device | xargs realpath | sed 's/.*\///'
}