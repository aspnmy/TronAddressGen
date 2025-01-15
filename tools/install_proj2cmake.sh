#!/bin/bash

get_proj2cmake(){
curl -O https://github.com/aspnmy/proj2cmake/releases/download/v1.0.0/proj2cmake.tar.gz
tar -xzvf proj2cmake.tar.gz
cd proj2cmake

    chmod +x proj2cmake
    proj2cmake -v
}

get_proj2cmake