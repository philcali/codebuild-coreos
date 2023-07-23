#!/usr/bin/env bash

for repo_file in fedora.repo fedora-coreos-pool.repo; do
    cp "$CODEBUILD_SRC_DIR"/fedora-coreos-config/$repo_file "$CODEBUILD_SRC_DIR/$repo_file"
done