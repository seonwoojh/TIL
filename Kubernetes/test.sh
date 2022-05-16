#!/bin/bash
ansible localhost -m ansible.builtin.setup | grep ansible_memtotal_mb
