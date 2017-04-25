#!/bin/bash

#Creating wrapper around ls. Overriding the ls command

ls() {
command ls -lh
}
echo lets test ls  now
ls
